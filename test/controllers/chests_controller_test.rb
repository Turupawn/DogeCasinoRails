require 'test_helper'

class ChestsControllerTest < ActionController::TestCase
  setup do
    @chest = chests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chest" do
    assert_difference('Chest.count') do
      post :create, chest: { price: @chest.price, prize: @chest.prize, user_id: @chest.user_id }
    end

    assert_redirected_to chest_path(assigns(:chest))
  end

  test "should show chest" do
    get :show, id: @chest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chest
    assert_response :success
  end

  test "should update chest" do
    patch :update, id: @chest, chest: { price: @chest.price, prize: @chest.prize, user_id: @chest.user_id }
    assert_redirected_to chest_path(assigns(:chest))
  end

  test "should destroy chest" do
    assert_difference('Chest.count', -1) do
      delete :destroy, id: @chest
    end

    assert_redirected_to chests_path
  end
end
