require 'test_helper'

class BpsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:bps)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_bp
    assert_difference('Bp.count') do
      post :create, :bp => { }
    end

    assert_redirected_to bp_path(assigns(:bp))
  end

  def test_should_show_bp
    get :show, :id => bps(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => bps(:one).id
    assert_response :success
  end

  def test_should_update_bp
    put :update, :id => bps(:one).id, :bp => { }
    assert_redirected_to bp_path(assigns(:bp))
  end

  def test_should_destroy_bp
    assert_difference('Bp.count', -1) do
      delete :destroy, :id => bps(:one).id
    end

    assert_redirected_to bps_path
  end
end
