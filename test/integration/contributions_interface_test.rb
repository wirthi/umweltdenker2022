require "test_helper"

class ContributionsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "contribution interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Contribution.count' do
      post contributions_path, params: { contribution: { content: "" } }
    end
    assert_select 'div#error_explanation'
    assert_select 'a[href=?]', '/?page=2' # Correct pagination link
    # Valid submission
    content = "This contribution really ties the room together"
    assert_difference 'Contribution.count', 1 do
      post contributions_path, params: { contribution: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post.
    assert_select 'a', text: 'delete'
    first_contribution = @user.contributions.paginate(page: 1).first
    assert_difference 'Contribution.count', -1 do
      delete contribution_path(first_contribution)
    end
    # Visit different user (no delete links).
    get user_path(users(:archer))
    assert_select 'a', { text: 'delete', count: 0 }
  end
end
