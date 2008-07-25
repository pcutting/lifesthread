#  create_table "support_dialogs", :force => true do |t|
#    t.integer  "support_id",       :limit => 11
#    t.integer  "user_id",          :limit => 11
#    t.text     "note"
#    t.integer  "rate_helpfulness", :limit => 11
#    t.boolean  "is_visible"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end



class SupportDialog < ActiveRecord::Base
belongs_to :support
belongs_to :user


def author
 u =  User.find_by_id(self.user_id) 
 u.first_name unless u.nil?
 
end


end
