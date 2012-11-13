class Content < ActiveRecord::Base
	belongs_to :trip
   attr_accessible :trip_id, :date_time, :value, :other, :content_type

   def self.save_content(content_type, value, trip_id, other)
   		base_dir = "app/assets/images/"
		
		content = Content.new
		content.trip_id = trip_id
		content.date_time = Time.new
		content.value = value
		content.content_type = content_type
		content.other = other

		if content_type == "image"
			f = File.open(base_dir + value)
    		size = ImageSize.new(f.read)

    		content.width = size.w
    		content.height = size.h
		end
		


		content.save()
	end
end
