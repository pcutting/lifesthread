class Stress < ActiveRecord::Base

belongs_to :user
has_many :stress_logs

end
