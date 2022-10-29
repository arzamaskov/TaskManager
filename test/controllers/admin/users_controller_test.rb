require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    admin = create(:admin)
    sign_in admin
  end

  test 'sould get show' do
    user = create(:user)
    get :show, params: { id: user.id }
    assert_response :success
  end

  test 'should get index' do
    get :index
    assert_response :success
  end
end
