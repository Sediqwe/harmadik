require 'test_helper'

class BelepesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get belepes_index_url
    assert_response :success
  end

end
