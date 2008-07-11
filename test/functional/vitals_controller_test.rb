require 'test_helper'

class VitalsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vitals)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vital
    assert_difference('Vital.count') do
      post :create, :vital => { }
    end

    assert_redirected_to vital_path(assigns(:vital))
  end

  def test_should_show_vital
    get :show, :id => vitals(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vitals(:one).id
    assert_response :success
  end

  def test_should_update_vital
    put :update, :id => vitals(:one).id, :vital => { }
    assert_redirected_to vital_path(assigns(:vital))
  end

  def test_should_destroy_vital
    assert_difference('Vital.count', -1) do
      delete :destroy, :id => vitals(:one).id
    end

    assert_redirected_to vitals_path
  end
end
