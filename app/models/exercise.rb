class Exercise < ActiveRecord::Base
 belongs_to :exercisable, :polymorphic => true
 
 
 
 
 
end
