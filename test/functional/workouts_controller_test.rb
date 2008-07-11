require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:workouts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_workout
    assert_difference('Workout.count') do
      post :create, :workout => { }
    end

    assert_redirected_to workout_path(assigns(:workout))
  end

  def test_should_show_workout
    get :show, :id => workouts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => workouts(:one).id
    assert_response :success
  end

  def test_should_update_workout
    put :update, :id => workouts(:one).id, :workout => { }
    assert_redirected_to workout_path(assigns(:workout))
  end

  def test_should_destroy_workout
    assert_difference('Workout.count', -1) do
      delete :destroy, :id => workouts(:one).id
    end

    assert_redirected_to workouts_path
  end
end
