require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest
  def setup
    @active_user = users(:pawel)
    @inactive_user = users(:inactive)
  end

  test "should redirect to root_url when user not activated" do
    get user_path(@inactive_user)
    assert_redirected_to root_url
  end

  test "should display active user" do
    get user_path(@active_user)
    assert_template "users/show"
    assert_response :success
  end

end
