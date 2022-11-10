FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { 'new_task' }
    expired_at { Date.current.next_week }
  end
end
