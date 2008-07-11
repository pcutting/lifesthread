class Question < ActiveRecord::Base

belongs_to :survey
belongs_to :opinion

end
