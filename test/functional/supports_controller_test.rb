require 'test_helper'

class SupportsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:supports)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_support
    assert_difference('Support.count') do
      post :create, :support => { }
    end

    assert_redirected_to support_path(assigns(:support))
  end

  def test_should_show_support
    get :show, :id => supports(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => supports(:one).id
    assert_response :success
  end

  def test_should_update_support
    put :update, :id => supports(:one).id, :support => { }
    assert_redirected_to support_path(assigns(:support))
  end

  def test_should_destroy_support
    assert_difference('Support.count', -1) do
      delete :destroy, :id => supports(:one).id
    end

    assert_redirected_to supports_path
  end
end
