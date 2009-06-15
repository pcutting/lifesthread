require 'test_helper'

class PharmacyEventsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pharmacy_events)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_pharmacy_events
    assert_difference('PharmacyEvents.count') do
      post :create, :pharmacy_events => { }
    end

    assert_redirected_to pharmacy_events_path(assigns(:pharmacy_events))
  end

  def test_should_show_pharmacy_events
    get :show, :id => pharmacy_events(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pharmacy_events(:one).id
    assert_response :success
  end

  def test_should_update_pharmacy_events
    put :update, :id => pharmacy_events(:one).id, :pharmacy_events => { }
    assert_redirected_to pharmacy_events_path(assigns(:pharmacy_events))
  end

  def test_should_destroy_pharmacy_events
    assert_difference('PharmacyEvents.count', -1) do
      delete :destroy, :id => pharmacy_events(:one).id
    end

    assert_redirected_to pharmacy_events_path
  end
end
