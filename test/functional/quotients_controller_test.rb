require 'test_helper'

class QuotientsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:quotients)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_quotient
    assert_difference('Quotient.count') do
      post :create, :quotient => { }
    end

    assert_redirected_to quotient_path(assigns(:quotient))
  end

  def test_should_show_quotient
    get :show, :id => quotients(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => quotients(:one).id
    assert_response :success
  end

  def test_should_update_quotient
    put :update, :id => quotients(:one).id, :quotient => { }
    assert_redirected_to quotient_path(assigns(:quotient))
  end

  def test_should_destroy_quotient
    assert_difference('Quotient.count', -1) do
      delete :destroy, :id => quotients(:one).id
    end

    assert_redirected_to quotients_path
  end
end
