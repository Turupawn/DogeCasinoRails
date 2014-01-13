require 'test_helper'

class FreetoplayuserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
