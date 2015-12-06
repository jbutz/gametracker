require 'test_helper'

class GamePlayRolesControllerTest < ActionController::TestCase
  setup do
    @game_play_role = game_play_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_play_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_play_role" do
    assert_difference('GamePlayRole.count') do
      post :create, game_play_role: { game_play_id: @game_play_role.game_play_id, game_role_id: @game_play_role.game_role_id, user_id: @game_play_role.user_id }
    end

    assert_redirected_to game_play_role_path(assigns(:game_play_role))
  end

  test "should show game_play_role" do
    get :show, id: @game_play_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_play_role
    assert_response :success
  end

  test "should update game_play_role" do
    patch :update, id: @game_play_role, game_play_role: { game_play_id: @game_play_role.game_play_id, game_role_id: @game_play_role.game_role_id, user_id: @game_play_role.user_id }
    assert_redirected_to game_play_role_path(assigns(:game_play_role))
  end

  test "should destroy game_play_role" do
    assert_difference('GamePlayRole.count', -1) do
      delete :destroy, id: @game_play_role
    end

    assert_redirected_to game_play_roles_path
  end
end
