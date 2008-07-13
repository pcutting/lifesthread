class Profile < ActiveRecord::Base

belongs_to :user

serialize :chart_options
serialize :favorits






end
