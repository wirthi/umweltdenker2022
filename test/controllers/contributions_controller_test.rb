require "test_helper"

class ContributionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @contribution = contributions(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Contribution.count' do
      post contributions_path, params: { contribution: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Contribution.count' do
      delete contribution_path(@contribution)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong contribution" do
    log_in_as(users(:michael))
    contribution = contributions(:ants)
    assert_no_difference 'Contribution.count' do
      delete contribution_path(contribution)
    end
    assert_redirected_to root_url
  end
end
