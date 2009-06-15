require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sponsor
    assert_difference('Sponsor.count') do
      post :create, :sponsor => { }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  def test_should_show_sponsor
    get :show, :id => sponsors(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sponsors(:one).id
    assert_response :success
  end

  def test_should_update_sponsor
    put :update, :id => sponsors(:one).id, :sponsor => { }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  def test_should_destroy_sponsor
    assert_difference('Sponsor.count', -1) do
      delete :destroy, :id => sponsors(:one).id
    end

    assert_redirected_to sponsors_path
  end
end
