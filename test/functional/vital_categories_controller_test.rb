require 'test_helper'

class VitalCategoriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vital_categories)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vital_category
    assert_difference('VitalCategory.count') do
      post :create, :vital_category => { }
    end

    assert_redirected_to vital_category_path(assigns(:vital_category))
  end

  def test_should_show_vital_category
    get :show, :id => vital_categories(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vital_categories(:one).id
    assert_response :success
  end

  def test_should_update_vital_category
    put :update, :id => vital_categories(:one).id, :vital_category => { }
    assert_redirected_to vital_category_path(assigns(:vital_category))
  end

  def test_should_destroy_vital_category
    assert_difference('VitalCategory.count', -1) do
      delete :destroy, :id => vital_categories(:one).id
    end

    assert_redirected_to vital_categories_path
  end
end
