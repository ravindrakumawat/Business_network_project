require 'test_helper'

class SoundsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound" do
    assert_difference('Sound.count') do
      post :create, :sound => { }
    end

    assert_redirected_to sound_path(assigns(:sound))
  end

  test "should show sound" do
    get :show, :id => sounds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sounds(:one).to_param
    assert_response :success
  end

  test "should update sound" do
    put :update, :id => sounds(:one).to_param, :sound => { }
    assert_redirected_to sound_path(assigns(:sound))
  end

  test "should destroy sound" do
    assert_difference('Sound.count', -1) do
      delete :destroy, :id => sounds(:one).to_param
    end

    assert_redirected_to sounds_path
  end
end
