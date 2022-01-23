require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
  end

  test "profile display - admin can see other user" do
    log_in_as(@admin)
    get user_path(@non_admin)
    assert_template 'users/show'
    assert_select 'title', full_title(@non_admin.firstname)
    assert_select 'h1', text: @non_admin.firstname
    assert_select 'h1>img.gravatar'
    assert_match @non_admin.contributions.count.to_s, response.body
    assert_select 'div.pagination'
    @non_admin.contributions.paginate(page: 1).each do |contribution|
      assert_match contribution.content, response.body
    end
  end

  #test "profile display - non-admin cannot see other user" do
  #  log_in_as(@non_admin)
  #  get user_path(@admin)
  #  assert_select 'h1', "Willkommen, " #redirected to user's home
  #end

end
