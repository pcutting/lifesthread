class Sponsor < ActiveRecord::Base

has_many :pharmacy_events
has_many :pharmacy_notices

#validates_uniqueness_of   :sponsor_id, :case_sensitive => false

end
