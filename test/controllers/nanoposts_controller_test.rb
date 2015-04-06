require 'test_helper'

class NanopostsControllerTest < ActionController::TestCase
  setup do
    @nanopost = nanoposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nanoposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nanopost" do
    assert_difference('Nanopost.count') do
      post :create, nanopost: { content: @nanopost.content, user_id: @nanopost.user_id }
    end

    assert_redirected_to nanopost_path(assigns(:nanopost))
  end

  test "should show nanopost" do
    get :show, id: @nanopost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nanopost
    assert_response :success
  end

  test "should update nanopost" do
    patch :update, id: @nanopost, nanopost: { content: @nanopost.content, user_id: @nanopost.user_id }
    assert_redirected_to nanopost_path(assigns(:nanopost))
  end

  test "should destroy nanopost" do
    assert_difference('Nanopost.count', -1) do
      delete :destroy, id: @nanopost
    end

    assert_redirected_to nanoposts_path
  end
end
