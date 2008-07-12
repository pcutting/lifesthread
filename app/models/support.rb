class Support < ActiveRecord::Base

belongs_to :user
has_many :support_dialogs
end
