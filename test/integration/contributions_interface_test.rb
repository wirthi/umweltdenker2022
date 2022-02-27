require "test_helper"

class ContributionsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @cat_energie = categories(:energie)
    @cat_traffic = categories(:traffic)
  end
  
  test "contribution interface" do
    log_in_as(@user)
    get root_path
    ## assert_select 'div.pagination' # not paginating currentls
    # Invalid submission
    assert_no_difference 'Contribution.count' do
      post contributions_path, params: { contribution: { content: "", participants: 1 } }
    end
    assert_select 'div#error_explanation'
    ## assert_select 'a[href=?]', '/?page=2' # Correct pagination link (not any longer!)
    # Valid submission
    content = "This contribution really ties the room together"
    assert_difference 'Contribution.count', 1 do
      post contributions_path, params: {
        contribution: {
          content: content,
          title: "example title",
          category_id: @cat_energie.id,
          participants: 1,
          amount: 42
        }
      }
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

  test "invalid contribution submission" do
    log_in_as(@user)
    assert_no_difference 'Contribution.count' do
      post contributions_path, params: { contribution: {
          content: "Testcontent",
          category_id: @cat_energie.id,
          title: ""
        }
      }
    end
    assert_template 'contributions/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "all contributions" do
    get contributions_path
    assert_template 'contributions/index'
  end

  test "contributions of category traffic are empty" do
    get contributions_path(:category => @cat_traffic)
    assert_template 'contributions/index'
  end
end
