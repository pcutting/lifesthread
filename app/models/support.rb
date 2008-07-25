
#  create_table "supports", :force => true do |t|
#    t.string   "title"
#    t.integer  "priority",         :limit => 11
#    t.string   "category"
#    t.string   "reference_page"
#    t.text     "comment"
#    t.boolean  "resolved"
#    t.datetime "resolved_on"
#    t.boolean  "ok_to_contact"
#    t.string   "contact_number"
#    t.integer  "user_id",          :limit => 11
#    t.boolean  "marked_closed"
#    t.datetime "marked_closed_on"
#    t.boolean  "reopen"
#    t.datetime "reopen_on"
#    t.boolean  "is_visible"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end



class Support < ActiveRecord::Base

belongs_to :user
has_many :support_dialogs

def prioritized
  u = User.find_by_id(self.user_id)
  self.priority * u.profile.user_priority
end

end
