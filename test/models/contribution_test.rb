require "test_helper"

class ContributionTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    energie = categories(:energie)
    @contribution = @user.contributions.build(content: "Lorem ipsum", category: energie)
  end

  test "should be valid" do
    assert @contribution.valid?
  end

  test "user id should be present" do
    @contribution.user_id = nil
    assert_not @contribution.valid?
  end

  test "content should be present" do
    @contribution.content = " "
    assert_not @contribution.valid?
    end

  test "content should be at most 140 characters" do
    @contribution.content = "a" * 141
    assert_not @contribution.valid?
  end

  test "category id should be present" do
    @contribution.category_id = nil
    assert_not @contribution.valid?
  end

  test "order should be most recent first" do
    assert_equal contributions(:most_recent), Contribution.first
  end
end
