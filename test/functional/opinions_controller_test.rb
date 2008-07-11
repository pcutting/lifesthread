require 'test_helper'

class OpinionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:opinions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_opinion
    assert_difference('Opinion.count') do
      post :create, :opinion => { }
    end

    assert_redirected_to opinion_path(assigns(:opinion))
  end

  def test_should_show_opinion
    get :show, :id => opinions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => opinions(:one).id
    assert_response :success
  end

  def test_should_update_opinion
    put :update, :id => opinions(:one).id, :opinion => { }
    assert_redirected_to opinion_path(assigns(:opinion))
  end

  def test_should_destroy_opinion
    assert_difference('Opinion.count', -1) do
      delete :destroy, :id => opinions(:one).id
    end

    assert_redirected_to opinions_path
  end
end
