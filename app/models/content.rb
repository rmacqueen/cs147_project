class Content < ActiveRecord::Base
	belongs_to :user
   attr_accessible :user_id, :date_time, :value, :other, :content_type

   def self.save_content(content_type, value, user_id, other)
		content = Content.new
		content.user_id = user_id
		content.date_time = Time.new
		content.value = value
		content.content_type = content_type
		content.other = other
		content.save()
	end
end
