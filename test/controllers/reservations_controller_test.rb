require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reservations_create_url
    assert_response :success
  end
end
