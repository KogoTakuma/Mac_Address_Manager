require 'test_helper'

class ElectronicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get electronic_index_url
    assert_response :success
  end

end
