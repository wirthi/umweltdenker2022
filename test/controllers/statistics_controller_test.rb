require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get contributions" do
    get statistics_contributions_url
    assert_response :success
  end
end
