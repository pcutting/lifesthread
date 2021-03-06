class ChartsController < ApplicationController


def index

  @chartoptions = current_user.profile.myChartOptions

  #flash[:notice] = current_user.profile.myChartOptions.to_yaml
  
  respond_to do |format|
    format.html # index.html.erb
  end
end

def create

  returned = params[:chartoptions]
  @results=Hash.new 

  @results = current_user.profile.updateChartOptions(returned)
  current_user.profile.chart_options = @results
  
  if current_user.profile.save
    @chartoptions = @results
   redirect_to(charts_path) 
  else
    flash[:error] = "There was a problem with updating your preferences."
    redirect_to(home_path)
  end


end

def update

  returned = params[:chartoptions]
  @results = Hash.new 
  @results = current_user.profile.updateChartOptions(returned)
  #raise @results.to_yaml
  #current_user.profile.chart_options = @results.to_yaml
  
  if current_user.profile.save
   redirect_to(charts_path) 
  else
    flash[:error] = "There was a problem with updating your preferences."
    redirect_to(home_path)
  end


end


def show

  respond_to do |format|
   format.html # show.html.erb
  end
end



end
