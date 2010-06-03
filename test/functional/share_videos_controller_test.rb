require 'test_helper'

class ShareVideosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_video" do
    assert_difference('ShareVideo.count') do
      post :create, :share_video => { }
    end

    assert_redirected_to share_video_path(assigns(:share_video))
  end

  test "should show share_video" do
    get :show, :id => share_videos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => share_videos(:one).to_param
    assert_response :success
  end

  test "should update share_video" do
    put :update, :id => share_videos(:one).to_param, :share_video => { }
    assert_redirected_to share_video_path(assigns(:share_video))
  end

  test "should destroy share_video" do
    assert_difference('ShareVideo.count', -1) do
      delete :destroy, :id => share_videos(:one).to_param
    end

    assert_redirected_to share_videos_path
  end
end
