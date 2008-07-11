require 'test_helper'

class StressesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:stresses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_stress
    assert_difference('Stress.count') do
      post :create, :stress => { }
    end

    assert_redirected_to stress_path(assigns(:stress))
  end

  def test_should_show_stress
    get :show, :id => stresses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => stresses(:one).id
    assert_response :success
  end

  def test_should_update_stress
    put :update, :id => stresses(:one).id, :stress => { }
    assert_redirected_to stress_path(assigns(:stress))
  end

  def test_should_destroy_stress
    assert_difference('Stress.count', -1) do
      delete :destroy, :id => stresses(:one).id
    end

    assert_redirected_to stresses_path
  end
end
