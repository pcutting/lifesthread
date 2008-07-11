class FitnessPlan < ActiveRecord::Base

belongs_to :user
has_many :exercises, :as => :exercisable

end
