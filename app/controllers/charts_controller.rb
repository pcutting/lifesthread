class ChartsController < ApplicationController

  def index
    @cholesterols = current_user.cholesterols.find(:all, :order => "measured_on desc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /cholesterols/1
  # GET /cholesterols/1.xml
  def show
    @cholesterol = current_user.cholesterols

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
