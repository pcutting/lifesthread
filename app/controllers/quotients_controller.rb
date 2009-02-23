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



    @quotient.f_score =  @quotient.red_meat + @quotient.fish + @quotient.poultry + @quotient.vegetables_daily + @quotient.fruit_daily + @quotient.vegetable_freshness + @quotient.fruit_freshness + @quotient.fried_foods + @quotient.over_eat + @quotient.food_variety + @quotient.fast_eater + @quotient.proper_potions + @quotient.eat_frequently + @quotient.daily_dessert + @quotient.whole_grain_breads 

    @quotient.f_score /= 15  #get average based on number of questions.

    @quotient.i_score = @quotient.happiness + 
    
    @quotient.smile_frequently +
     @quotient.enjoy_daily_activities + 
     @quotient.faith + 
     @quotient.reached_potential +
      @quotient.reach_goals_regularly + 
      @quotient.have_inspiring_people + 
      @quotient.listen_to_music + 
      @quotient.have_hobby + 
      @quotient.hours_tv_daily + @quotient.read_books + @quotient.daily_newspaper + @quotient.watch_sporting_events + @quotient.consider_news_negative + @quotient.talk_with_friends + @quotient.talk_with_family
    
    @quotient.i_score /= 15
    
    @quotient.b_score = @quotient.happy_with_body_type + @quotient.happy_with_mirror_reflection + @quotient.daily_exercise + @quotient.weekly_exercise + @quotient.able_to_walk_distance + @quotient.physical_limitations + @quotient.understand_fitness + @quotient.recent_operations + @quotient.recent_medical_tests + @quotient.chronic_medical_problems + @quotient.desired_life_span 

@quotient.b_score /= 10 
 
    @quotient.e_score = @quotient.like_state_residence + @quotient.like_city_residence + 
@quotient.like_geographical_area + @quotient.like_home + @quotient.like_working_environment + 
@quotient.prefer_different_home_environment + @quotient.prefer_different_work_environment + 
@quotient.planning_move + @quotient.planning_job_change + @quotient.planning_home_renovations  

    @quotient.e_score /= 10

    @quotient.r_score = @quotient.over_5_friends + @quotient.over_5_relatives + @quotient.have_to_many_friends + @quotient.have_to_many_relatives + @quotient.close_to_parents + 
@quotient.close_to_aunts_uncles + @quotient.close_to_siblings + @quotient.close_to_inlaws

  
@quotient.r_score /= 9


@quotient.sleep_score = @quotient.sleep_enough + 
@quotient.stay_up_late + 
@quotient.wake_during_night + 
@quotient.comfartable_while_sleeping + 
@quotient.wake_rested + 
@quotient.take_naps + 
@quotient.have_dreams + 
@quotient.remember_most_dreams + 
@quotient.comfortable_bed + 
@quotient.comfortable_pillow


@quotient.sleep_score /= 10


@quotient.stress_score = @quotient.currently_worried + 
@quotient.worried_as_prior_year + 
@quotient.worry_future + 
@quotient.worry_finances + 
@quotient.worry_about_health + 
@quotient.witness_politics + 
@quotient.count_todays_worries + 
@quotient.easy_life 

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
