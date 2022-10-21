class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, :description, :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine initial: :new_task do
    state :new_task
    state :archieved
    state :in_development
    state :in_qa
    state :in_code_review
    state :ready_for_release
    state :released

    event :send_to_develop do
      transition [:new_task, :in_qa, :in_code_review] => :in_development
    end

    event :develop do
      transition in_development: :in_qa
    end

    event :test do
      transition in_qa: :in_code_review
    end

    event :review do
      transition in_code_review: :ready_for_release
    end

    event :release do
      transition ready_for_release: :released
    end

    event :archive do
      transition [:new_task, :released] => :archieved
    end
  end
end
