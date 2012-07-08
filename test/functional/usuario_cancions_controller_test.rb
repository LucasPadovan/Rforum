require 'test_helper'

class UsuarioCancionsControllerTest < ActionController::TestCase
  setup do
    @usuario_cancion = usuario_cancions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_cancions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_cancion" do
    assert_difference('UsuarioCancion.count') do
      post :create, usuario_cancion: @usuario_cancion.attributes
    end

    assert_redirected_to usuario_cancion_path(assigns(:usuario_cancion))
  end

  test "should show usuario_cancion" do
    get :show, id: @usuario_cancion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario_cancion.to_param
    assert_response :success
  end

  test "should update usuario_cancion" do
    put :update, id: @usuario_cancion.to_param, usuario_cancion: @usuario_cancion.attributes
    assert_redirected_to usuario_cancion_path(assigns(:usuario_cancion))
  end

  test "should destroy usuario_cancion" do
    assert_difference('UsuarioCancion.count', -1) do
      delete :destroy, id: @usuario_cancion.to_param
    end

    assert_redirected_to usuario_cancions_path
  end
end
