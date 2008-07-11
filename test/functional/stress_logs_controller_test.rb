require 'test_helper'

class StressLogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:stress_logs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_stress_log
    assert_difference('StressLog.count') do
      post :create, :stress_log => { }
    end

    assert_redirected_to stress_log_path(assigns(:stress_log))
  end

  def test_should_show_stress_log
    get :show, :id => stress_logs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => stress_logs(:one).id
    assert_response :success
  end

  def test_should_update_stress_log
    put :update, :id => stress_logs(:one).id, :stress_log => { }
    assert_redirected_to stress_log_path(assigns(:stress_log))
  end

  def test_should_destroy_stress_log
    assert_difference('StressLog.count', -1) do
      delete :destroy, :id => stress_logs(:one).id
    end

    assert_redirected_to stress_logs_path
  end
end
