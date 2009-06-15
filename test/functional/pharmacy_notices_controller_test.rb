require 'test_helper'

class PharmacyNoticesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pharmacy_notices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_pharmacy_notices
    assert_difference('PharmacyNotices.count') do
      post :create, :pharmacy_notices => { }
    end

    assert_redirected_to pharmacy_notices_path(assigns(:pharmacy_notices))
  end

  def test_should_show_pharmacy_notices
    get :show, :id => pharmacy_notices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pharmacy_notices(:one).id
    assert_response :success
  end

  def test_should_update_pharmacy_notices
    put :update, :id => pharmacy_notices(:one).id, :pharmacy_notices => { }
    assert_redirected_to pharmacy_notices_path(assigns(:pharmacy_notices))
  end

  def test_should_destroy_pharmacy_notices
    assert_difference('PharmacyNotices.count', -1) do
      delete :destroy, :id => pharmacy_notices(:one).id
    end

    assert_redirected_to pharmacy_notices_path
  end
end
