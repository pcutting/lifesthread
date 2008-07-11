require 'test_helper'

class FitnessPlansControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:fitness_plans)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_fitness_plan
    assert_difference('FitnessPlan.count') do
      post :create, :fitness_plan => { }
    end

    assert_redirected_to fitness_plan_path(assigns(:fitness_plan))
  end

  def test_should_show_fitness_plan
    get :show, :id => fitness_plans(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => fitness_plans(:one).id
    assert_response :success
  end

  def test_should_update_fitness_plan
    put :update, :id => fitness_plans(:one).id, :fitness_plan => { }
    assert_redirected_to fitness_plan_path(assigns(:fitness_plan))
  end

  def test_should_destroy_fitness_plan
    assert_difference('FitnessPlan.count', -1) do
      delete :destroy, :id => fitness_plans(:one).id
    end

    assert_redirected_to fitness_plans_path
  end
end
