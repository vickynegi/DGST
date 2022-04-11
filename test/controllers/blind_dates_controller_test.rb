require "test_helper"

class BlindDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blind_dates_index_url
    assert_response :success
  end

  test "should get create" do
    get blind_dates_create_url
    assert_response :success
  end
end
