require 'test_helper'

class GameRolesControllerTest < ActionController::TestCase
  setup do
    @game_role = game_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_role" do
    assert_difference('GameRole.count') do
      post :create, game_role: { game_id: @game_role.game_id, name: @game_role.name }
    end

    assert_redirected_to game_role_path(assigns(:game_role))
  end

  test "should show game_role" do
    get :show, id: @game_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_role
    assert_response :success
  end

  test "should update game_role" do
    patch :update, id: @game_role, game_role: { game_id: @game_role.game_id, name: @game_role.name }
    assert_redirected_to game_role_path(assigns(:game_role))
  end

  test "should destroy game_role" do
    assert_difference('GameRole.count', -1) do
      delete :destroy, id: @game_role
    end

    assert_redirected_to game_roles_path
  end
end
