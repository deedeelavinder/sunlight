require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get show" do
    get :show
    end

  test "should get index" do
    get :index
    assert_response :success
  end

end
