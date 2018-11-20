require 'test_helper'

class My::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_events_index_url
    assert_response :success
  end

end
