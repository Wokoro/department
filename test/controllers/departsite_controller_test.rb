require 'test_helper'

class DepartsiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get departsite_index_url
    assert_response :success
  end

end
