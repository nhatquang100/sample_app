require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users :quang
  end

  test "unsuccessful edit" do
    log_in_as @user
    get edit_user_path @user
    assert_template "users/edit"
    patch user_path @user, params: {user: {
      name: "",
      email: "vonhatquang@gmail",
      password: "123",
      password_confirmation: "456"
    }}
    assert_template "users/edit"
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path @user
    log_in_as @user
    assert_redirected_to edit_user_url @user
    name  = "Nhat Quang"
    email = "vonhatquang100@gmail.com"
    patch user_path @user, params: {user: {
      name: name,
      mail: email,
      password: "",
      password_confirmation: ""
    }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
