require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get contributions" do
    get statistics_contributions_url
    assert_response :success
  end

  test "should get overview" do
    get statistics_overview_url
    assert_response :success
  end
end
