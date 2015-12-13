require 'test_helper'

class WinConditionsControllerTest < ActionController::TestCase
  setup do
    @win_condition = win_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:win_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create win_condition" do
    assert_difference('WinCondition.count') do
      post :create, win_condition: { game_id: @win_condition.game_id, name: @win_condition.name }
    end

    assert_redirected_to win_condition_path(assigns(:win_condition))
  end

  test "should show win_condition" do
    get :show, id: @win_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @win_condition
    assert_response :success
  end

  test "should update win_condition" do
    patch :update, id: @win_condition, win_condition: { game_id: @win_condition.game_id, name: @win_condition.name }
    assert_redirected_to win_condition_path(assigns(:win_condition))
  end

  test "should destroy win_condition" do
    assert_difference('WinCondition.count', -1) do
      delete :destroy, id: @win_condition
    end

    assert_redirected_to win_conditions_path
  end
end
