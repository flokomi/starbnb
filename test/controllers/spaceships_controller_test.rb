require "test_helper"

class SpaceshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spaceships_index_url
    assert_response :success
  end

  test "should get show" do
    get spaceships_show_url
    assert_response :success
  end
end
