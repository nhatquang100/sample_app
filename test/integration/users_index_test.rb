require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users :quang
    @non_admin = users :quang1
  end

  test "index including pagination and delete links" do
    log_in_as @admin
    get users_path
    assert_template "users/index"
    assert_select "div.pagination"
    first_page_of_users = User.paginate page: Settings.number.one
    first_page_of_users.each do |user|
      unless user == @admin
        assert_select "a[href=?]", user_path(user), text: "delete", count: 0
      end
    end
    assert_difference "User.count", -Settings.number.one do
      delete user_path @non_admin
    end
  end

  test "index as non-admin" do
    log_in_as @non_admin
    get users_path
    assert_select "a", text: "delete", count: 0
  end
end
