require 'test_helper'

class SleepsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sleeps)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sleep
    assert_difference('Sleep.count') do
      post :create, :sleep => { }
    end

    assert_redirected_to sleep_path(assigns(:sleep))
  end

  def test_should_show_sleep
    get :show, :id => sleeps(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sleeps(:one).id
    assert_response :success
  end

  def test_should_update_sleep
    put :update, :id => sleeps(:one).id, :sleep => { }
    assert_redirected_to sleep_path(assigns(:sleep))
  end

  def test_should_destroy_sleep
    assert_difference('Sleep.count', -1) do
      delete :destroy, :id => sleeps(:one).id
    end

    assert_redirected_to sleeps_path
  end
end
