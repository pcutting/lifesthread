require 'test_helper'

class MedicationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:medications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_medication
    assert_difference('Medication.count') do
      post :create, :medication => { }
    end

    assert_redirected_to medication_path(assigns(:medication))
  end

  def test_should_show_medication
    get :show, :id => medications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => medications(:one).id
    assert_response :success
  end

  def test_should_update_medication
    put :update, :id => medications(:one).id, :medication => { }
    assert_redirected_to medication_path(assigns(:medication))
  end

  def test_should_destroy_medication
    assert_difference('Medication.count', -1) do
      delete :destroy, :id => medications(:one).id
    end

    assert_redirected_to medications_path
  end
end
