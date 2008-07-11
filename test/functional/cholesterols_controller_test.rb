require 'test_helper'

class CholesterolsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cholesterols)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cholesterol
    assert_difference('Cholesterol.count') do
      post :create, :cholesterol => { }
    end

    assert_redirected_to cholesterol_path(assigns(:cholesterol))
  end

  def test_should_show_cholesterol
    get :show, :id => cholesterols(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cholesterols(:one).id
    assert_response :success
  end

  def test_should_update_cholesterol
    put :update, :id => cholesterols(:one).id, :cholesterol => { }
    assert_redirected_to cholesterol_path(assigns(:cholesterol))
  end

  def test_should_destroy_cholesterol
    assert_difference('Cholesterol.count', -1) do
      delete :destroy, :id => cholesterols(:one).id
    end

    assert_redirected_to cholesterols_path
  end
end
