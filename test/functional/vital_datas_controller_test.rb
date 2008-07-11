require 'test_helper'

class VitalDatasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vital_datas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vital_data
    assert_difference('VitalData.count') do
      post :create, :vital_data => { }
    end

    assert_redirected_to vital_data_path(assigns(:vital_data))
  end

  def test_should_show_vital_data
    get :show, :id => vital_datas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vital_datas(:one).id
    assert_response :success
  end

  def test_should_update_vital_data
    put :update, :id => vital_datas(:one).id, :vital_data => { }
    assert_redirected_to vital_data_path(assigns(:vital_data))
  end

  def test_should_destroy_vital_data
    assert_difference('VitalData.count', -1) do
      delete :destroy, :id => vital_datas(:one).id
    end

    assert_redirected_to vital_datas_path
  end
end
