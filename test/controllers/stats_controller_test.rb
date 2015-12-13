require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get stats" do
    get :stats
    assert_response :success
  end

end
