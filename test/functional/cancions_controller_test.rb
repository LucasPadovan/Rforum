require 'test_helper'

class CancionsControllerTest < ActionController::TestCase
  setup do
    @cancion = cancions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cancions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cancion" do
    assert_difference('Cancion.count') do
      post :create, cancion: @cancion.attributes
    end

    assert_redirected_to cancion_path(assigns(:cancion))
  end

  test "should show cancion" do
    get :show, id: @cancion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cancion.to_param
    assert_response :success
  end

  test "should update cancion" do
    put :update, id: @cancion.to_param, cancion: @cancion.attributes
    assert_redirected_to cancion_path(assigns(:cancion))
  end

  test "should destroy cancion" do
    assert_difference('Cancion.count', -1) do
      delete :destroy, id: @cancion.to_param
    end

    assert_redirected_to cancions_path
  end
end
