class Relationship < ActiveRecord::Base
belongs_to :user

has_many :journals
end
