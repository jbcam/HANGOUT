require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendees_create_url
    assert_response :success
  end

end
