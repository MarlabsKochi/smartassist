require 'test_helper'

class FloorMapsControllerTest < ActionController::TestCase
  setup do
    @floor_map = floor_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:floor_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create floor_map" do
    assert_difference('FloorMap.count') do
      post :create, floor_map: { name: @floor_map.name }
    end

    assert_redirected_to floor_map_path(assigns(:floor_map))
  end

  test "should show floor_map" do
    get :show, id: @floor_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @floor_map
    assert_response :success
  end

  test "should update floor_map" do
    patch :update, id: @floor_map, floor_map: { name: @floor_map.name }
    assert_redirected_to floor_map_path(assigns(:floor_map))
  end

  test "should destroy floor_map" do
    assert_difference('FloorMap.count', -1) do
      delete :destroy, id: @floor_map
    end

    assert_redirected_to floor_maps_path
  end
end
