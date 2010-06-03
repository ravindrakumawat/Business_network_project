require 'test_helper'

class GroupTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_type" do
    assert_difference('GroupType.count') do
      post :create, :group_type => { }
    end

    assert_redirected_to group_type_path(assigns(:group_type))
  end

  test "should show group_type" do
    get :show, :id => group_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => group_types(:one).to_param
    assert_response :success
  end

  test "should update group_type" do
    put :update, :id => group_types(:one).to_param, :group_type => { }
    assert_redirected_to group_type_path(assigns(:group_type))
  end

  test "should destroy group_type" do
    assert_difference('GroupType.count', -1) do
      delete :destroy, :id => group_types(:one).to_param
    end

    assert_redirected_to group_types_path
  end
end
