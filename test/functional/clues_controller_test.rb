require 'test_helper'

class CluesControllerTest < ActionController::TestCase
  setup do
    @clue = clues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clue" do
    assert_difference('Clue.count') do
      post :create, :clue => @clue.attributes
    end

    assert_redirected_to clue_path(assigns(:clue))
  end

  test "should show clue" do
    get :show, :id => @clue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @clue.to_param
    assert_response :success
  end

  test "should update clue" do
    put :update, :id => @clue.to_param, :clue => @clue.attributes
    assert_redirected_to clue_path(assigns(:clue))
  end

  test "should destroy clue" do
    assert_difference('Clue.count', -1) do
      delete :destroy, :id => @clue.to_param
    end

    assert_redirected_to clues_path
  end
end
