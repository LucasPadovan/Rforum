require 'test_helper'

class MensajepersonalsControllerTest < ActionController::TestCase
  setup do
    @mensajepersonal = mensajepersonals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensajepersonals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mensajepersonal" do
    assert_difference('Mensajepersonal.count') do
      post :create, mensajepersonal: @mensajepersonal.attributes
    end

    assert_redirected_to mensajepersonal_path(assigns(:mensajepersonal))
  end

  test "should show mensajepersonal" do
    get :show, id: @mensajepersonal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mensajepersonal.to_param
    assert_response :success
  end

  test "should update mensajepersonal" do
    put :update, id: @mensajepersonal.to_param, mensajepersonal: @mensajepersonal.attributes
    assert_redirected_to mensajepersonal_path(assigns(:mensajepersonal))
  end

  test "should destroy mensajepersonal" do
    assert_difference('Mensajepersonal.count', -1) do
      delete :destroy, id: @mensajepersonal.to_param
    end

    assert_redirected_to mensajepersonals_path
  end
end
