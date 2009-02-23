class CreateQuotients < ActiveRecord::Migration
  def self.up
    create_table :quotients do |t|
      t.references :user
      t.integer :red_meat
      t.integer :fish
      t.integer :poultry
      t.integer :vegetables_daily
      t.integer :fruit_daily
      t.integer :vegetable_freshness
      t.integer :fruit_freshness
      t.integer :fried_foods
      t.integer :over_eat
      t.integer :food_variety
      t.integer :fast_eater
      t.integer :proper_potions
      t.integer :eat_frequently
      t.integer :daily_dessert
      t.integer :whole_grain_breads
      t.integer :happiness
      t.integer :smile_frequently
      t.integer :enjoy_daily_activities
      t.integer :faith
      t.integer :reached_potential
      t.integer :reach_goals_regularly
      t.integer :have_inspiring_people
      t.integer :listen_to_music
      t.integer :have_hobby
      t.integer :hours_tv_daily
      t.integer :read_books
      t.integer :daily_newspaper
      t.integer :watch_sporting_events
      t.integer :consider_news_negative
      t.integer :talk_with_friends
      t.integer :talk_with_family
      t.integer :happy_with_body_type
      t.integer :happy_with_mirror_reflection
      t.integer :daily_exercise
      t.integer :weekly_exercise
      t.integer :able_to_walk_distance
      t.integer :physical_limitations
      t.integer :understand_fitness
      t.integer :recent_operations
      t.integer :recent_medical_tests
      t.integer :chronic_medical_problems
      t.integer :desired_life_span
      t.integer :like_state_residence
      t.integer :like_city_residence
      t.integer :like_geographical_area
      t.integer :like_home
      t.integer :like_working_environment
      t.integer :prefer_different_home_environment
      t.integer :prefer_different_work_environment
      t.integer :planning_move
      t.integer :planning_job_change
      t.integer :planning_home_renovations
      t.integer :over_5_friends
      t.integer :over_5_relatives
      t.integer :have_to_many_friends
      t.integer :have_to_many_relatives
      t.integer :close_to_parents
      t.integer :close_to_aunts_uncles
      t.integer :close_to_siblings
      t.integer :close_to_inlaws
      t.integer :sleep_enough
      t.integer :stay_up_late
      t.integer :wake_during_night
      t.integer :comfartable_while_sleeping
      t.integer :wake_rested
      t.integer :take_naps
      t.integer :have_dreams
      t.integer :remember_most_dreams
      t.integer :comfortable_bed
      t.integer :comfortable_pillow
      t.integer :currently_worried
      t.integer :worried_as_prior_year
      t.integer :worry_future
      t.integer :worry_finances
      t.integer :worry_about_health
      t.integer :witness_politics
      t.integer :count_todays_worries
      t.integer :easy_life
      t.integer :f_score , :default => 0
      t.integer :i_score , :default => 0
      t.integer :b_score , :default => 0
      t.integer :e_score , :default => 0
      t.integer :r_score , :default => 0
      t.integer :sleep_score , :default => 0
      t.integer :stress_score , :default => 0
      t.integer :fibers_score , :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :quotients
  end
end
