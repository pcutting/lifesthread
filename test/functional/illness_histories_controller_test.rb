require 'test_helper'

class IllnessHistoriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:illness_histories)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_illness_history
    assert_difference('IllnessHistory.count') do
      post :create, :illness_history => { }
    end

    assert_redirected_to illness_history_path(assigns(:illness_history))
  end

  def test_should_show_illness_history
    get :show, :id => illness_histories(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => illness_histories(:one).id
    assert_response :success
  end

  def test_should_update_illness_history
    put :update, :id => illness_histories(:one).id, :illness_history => { }
    assert_redirected_to illness_history_path(assigns(:illness_history))
  end

  def test_should_destroy_illness_history
    assert_difference('IllnessHistory.count', -1) do
      delete :destroy, :id => illness_histories(:one).id
    end

    assert_redirected_to illness_histories_path
  end
end
