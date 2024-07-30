require "test_helper"

class ParticipationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participation_new_url
    assert_response :success
  end
end
