class Trip < ActiveRecord::Base
	belongs_to :user
	has_many :contents
   attr_accessible :name, :cover_photo, :user_id
end
