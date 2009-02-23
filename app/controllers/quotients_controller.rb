class QuotientsController < ApplicationController
  # GET /quotients
  # GET /quotients.xml
  def index
    @quotients = current_user.quotients.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotients }
    end
  end

  # GET /quotients/1
  # GET /quotients/1.xml
  def show
    @quotient = current_user.quotients.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quotient }
    end
  end

  # GET /quotients/new
  # GET /quotients/new.xml
  def new
    @quotient = current_user.quotients.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quotient }
    end
  end

  # GET /quotients/1/edit
  def edit
    @quotient = current_user.quotients.find(params[:id])
  end

  # POST /quotients
  # POST /quotients.xml
  def create
    @quotient = current_user.quotients.new(params[:quotient])

 #raise @quotient.to_yaml

  @quotient.f_score =   (@quotient.red_meat ||= 0) + 
  (@quotient.fish ||= 0) + 
  (@quotient.poultry ||= 0) +
  (@quotient.vegetables_daily ||= 0) + 
  (@quotient.fruit_daily ||= 0) +
  (@quotient.vegetable_freshness ||= 0) + 
  (@quotient.fruit_freshness ||= 0) + 
  (@quotient.fried_foods ||= 0) + 
  (@quotient.over_eat ||= 0) + 
  (@quotient.food_variety ||= 0) + 
  (@quotient.fast_eater ||= 0) + 
  (@quotient.proper_potions ||= 0) + 
  (@quotient.eat_frequently ||= 0) + 
  (@quotient.daily_dessert ||= 0) + 
  (@quotient.whole_grain_breads ||= 0 )


  #raise @quotient.to_yaml


  @quotient.f_score /= 15  #get average based on number of questions.

  @quotient.i_score = (@quotient.happiness||= 0) + 
  (@quotient.smile_frequently||= 0) + 
  (@quotient.enjoy_daily_activities||= 0) + 
  (@quotient.faith ||= 0) + 
  (@quotient.reached_potential ||= 0) + 
  (@quotient.reach_goals_regularly ||= 0) + 
  (@quotient.have_inspiring_people ||= 0) + 
  (@quotient.listen_to_music ||= 0) + 
  (@quotient.have_hobby ||= 0) + 
  (@quotient.hours_tv_daily ||= 0) + 
  (@quotient.read_books ||= 0) + 
  (@quotient.daily_newspaper ||= 0) + 
  (@quotient.watch_sporting_events ||= 0) + 
  (@quotient.consider_news_negative ||= 0) + 
  (@quotient.talk_with_friends ||= 0) + 
  (@quotient.talk_with_family ||= 0) 

  @quotient.i_score /= 15

  @quotient.b_score = (@quotient.happy_with_body_type ||= 0) + 
  (@quotient.happy_with_mirror_reflection ||= 0) + 
  (@quotient.daily_exercise ||= 0) + 
  (@quotient.weekly_exercise ||= 0) + 
  (@quotient.able_to_walk_distance ||= 0) + 
  (@quotient.physical_limitations ||= 0) + 
  (@quotient.understand_fitness ||= 0) + 
  (@quotient.recent_operations ||= 0) + 
  (@quotient.recent_medical_tests ||= 0) + 
  (@quotient.chronic_medical_problems ||= 0) + 
  (@quotient.desired_life_span ||= 0) 

  @quotient.b_score /= 10 

  @quotient.e_score = (@quotient.like_state_residence ||= 0) + 
  (@quotient.like_city_residence ||= 0) + 
  (@quotient.like_geographical_area ||= 0) + 
  (@quotient.like_home ||= 0) + 
  (@quotient.like_working_environment ||= 0) + 
  (@quotient.prefer_different_home_environment ||= 0) + 
  (@quotient.prefer_different_work_environment ||= 0) + 
  (@quotient.planning_move ||= 0) + 
  (@quotient.planning_job_change ||= 0) + 
  (@quotient.planning_home_renovations  ||= 0) 

  @quotient.e_score /= 10

  @quotient.r_score = (@quotient.over_5_friends ||= 0) + 
  (@quotient.over_5_relatives ||= 0) + 
  (@quotient.have_to_many_friends ||= 0) + 
  (@quotient.have_to_many_relatives ||= 0) + 
  (@quotient.close_to_parents ||= 0) + 
  (@quotient.close_to_aunts_uncles ||= 0) + 
  (@quotient.close_to_siblings ||= 0) + 
  (@quotient.close_to_inlaws ||= 0) 

  
  @quotient.r_score /= 9


  @quotient.sleep_score = ( @quotient.sleep_enough ||= 0) + 
  (@quotient.stay_up_late ||= 0) + 
  (@quotient.wake_during_night ||= 0) + 
  (@quotient.comfartable_while_sleeping ||= 0) + 
  (@quotient.wake_rested ||= 0) + 
  (@quotient.take_naps ||= 0) + 
  (@quotient.have_dreams ||= 0) + 
  (@quotient.remember_most_dreams ||= 0) + 
  (@quotient.comfortable_bed ||= 0) + 
  (@quotient.comfortable_pillow ||= 0 )


  @quotient.sleep_score /= 10


  @quotient.stress_score = (@quotient.currently_worried ||= 0) + 
  (@quotient.worried_as_prior_year ||= 0) + 
  (@quotient.worry_future ||= 0) + 
  (@quotient.worry_finances ||= 0) + 
  (@quotient.worry_about_health ||= 0) + 
  (@quotient.witness_politics ||= 0) + 
  (@quotient.count_todays_worries ||= 0) + 
  (@quotient.easy_life ||= 0 )

  @quotient.stress_score /= 8



    respond_to do |format|
      if @quotient.save
        flash[:notice] = 'Quotient was successfully created.'
        format.html { redirect_to(home_path)  }
        #format.xml  { render :xml => @quotient, :status => :created, :location => @quotient }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @quotient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotients/1
  # PUT /quotients/1.xml
  def update
    @quotient = current_user.quotients.find(params[:id])

    respond_to do |format|
      if @quotient.update_attributes(params[:quotient])
        flash[:notice] = 'Quotient was successfully updated.'
        format.html { redirect_to(@quotient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quotient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotients/1
  # DELETE /quotients/1.xml
  def destroy
    @quotient = current_user.quotients.find(params[:id])
    @quotient.destroy

    respond_to do |format|
      format.html { redirect_to(quotients_url) }
      format.xml  { head :ok }
    end
  end
end
