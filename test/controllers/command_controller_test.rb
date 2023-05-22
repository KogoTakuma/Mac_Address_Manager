require 'test_helper'

class CommandControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get command_generate_url
    assert_response :success
  end

end
