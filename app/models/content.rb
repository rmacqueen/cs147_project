class Content < ActiveRecord::Base
	belongs_to :user
   attr_accessible :user_id, :date_time, :value, :other, :content_type
end
