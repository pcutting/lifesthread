require 'test_helper'

class SupportDialogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:support_dialogs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_support_dialog
    assert_difference('SupportDialog.count') do
      post :create, :support_dialog => { }
    end

    assert_redirected_to support_dialog_path(assigns(:support_dialog))
  end

  def test_should_show_support_dialog
    get :show, :id => support_dialogs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => support_dialogs(:one).id
    assert_response :success
  end

  def test_should_update_support_dialog
    put :update, :id => support_dialogs(:one).id, :support_dialog => { }
    assert_redirected_to support_dialog_path(assigns(:support_dialog))
  end

  def test_should_destroy_support_dialog
    assert_difference('SupportDialog.count', -1) do
      delete :destroy, :id => support_dialogs(:one).id
    end

    assert_redirected_to support_dialogs_path
  end
end
