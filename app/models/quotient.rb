class Quotient < ActiveRecord::Base
belongs_to :user

def default 
self.user = current_user
self.red_meat  ||= 0
self.fish  ||= 1
self.poultry  ||= 1
self.vegetables_daily  ||= 1
self.fruit_daily  ||= 1
self.vegetable_freshness  ||= 1
self.fruit_freshness  ||= 1
self.fried_foods  ||= 1
self.over_eat  ||= 1
self.food_variety  ||= 1
self.fast_eater  ||= 1
self.proper_potions  ||= 1
self.eat_frequently  ||= 1
self.daily_dessert  ||= 1
self.whole_grain_breads  ||= 1

self.happiness  ||= 1
self.smile_frequently  ||= 1
self.enjoy_daily_activities  ||= 1
self.faith  ||= 1
self.reached_potential  ||= 1
self.reach_goals_regularly  ||= 1
self.have_inspiring_people  ||= 1
self.listen_to_music  ||= 1
self.have_hobby  ||= 1
self.hours_tv_daily  ||= 1
self.read_books  ||= 1
self.daily_newspaper  ||= 1
self.watch_sporting_events  ||= 1
self.consider_news_negative  ||= 1
self.talk_with_friends  ||= 1
self.talk_with_family  ||= 1

self.happy_with_body_type  ||= 1
self.happy_with_mirror_reflection  ||= 1
self.daily_exercise  ||= 1
self.weekly_exercise  ||= 1
self.able_to_walk_distance  ||= 1
self.physical_limitations  ||= 1
self.understand_fitness  ||= 1
self.recent_operations  ||= 1
self.recent_medical_tests  ||= 1
self.chronic_medical_problems  ||= 1
self.desired_life_span  ||= 1

self.like_state_residence  ||= 1
self.like_city_residence  ||= 1
self.like_geographical_area  ||= 1
self.like_home  ||= 1
self.like_working_environment  ||= 1
self.prefer_different_home_environment  ||= 1
self.prefer_different_work_environment  ||= 1
self.planning_move  ||= 1
self.planning_job_change  ||= 1
self.planning_home_renovations  ||= 1

self.over_5_friends  ||= 1
self.over_5_relatives  ||= 1
self.have_to_many_friends  ||= 1
self.have_to_many_relatives  ||= 1
self.close_to_parents  ||= 1
self.close_to_aunts_uncles  ||= 1
self.close_to_siblings  ||= 1
self.close_to_inlaws  ||= 1


self.sleep_enough  ||= 1
self.stay_up_late  ||= 1
self.wake_during_night  ||= 1
self.comfartable_while_sleeping  ||= 1
self.wake_rested  ||= 1
self.take_naps  ||= 1
self.have_dreams  ||= 1
self.remember_most_dreams  ||= 1
self.comfortable_bed  ||= 1
self.comfortable_pillow  ||= 1

self.currently_worried  ||= 1
self.worried_as_prior_year  ||= 1
self.worry_future  ||= 1
self.worry_finances  ||= 1
self.worry_about_health  ||= 1
self.witness_politics  ||= 1
self.count_todays_worries  ||= 1
self.easy_life  ||= 1



end # def initialize

end
