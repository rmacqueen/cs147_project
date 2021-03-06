class TripController < ApplicationController

	def view

	end

	def new_trip
		trip = Trip.new(:cover_photo => "stock.jpg", :name => "New Trip", :user_id => session["user"])
		trip.save()
		time = Time.new()
		Content.save_content("milestone", "New Day", trip.id, 0, "");		
		redirect_to "/trip/layout/" + trip.id.to_s
	end

	def add
		puts "in trip add"
		puts session["user"]
		puts params
		@trip_id = params["trip_id"]
		@milestone_index = params["index"]

	end

	 def show
	 	puts "videos"
	    videos = Content.find_all_by_content_type("video")
	    video = videos[0]
		@original_video = video.panda_video
	    @h264_encoding = @original_video.encodings["h264"]
	    
	    
 	 end

	def post_add

		puts "In post_add"

		user = User.find(session["user"])
		puts params
		trip = Trip.find(params[:trip_id])
		
		if params[:content] != nil
			puts "saving content"
			content_type = params[:content][:content_type]
			value = ""
			other = ""
			if content_type == "video"
				puts "saving a video"
				value = params["video"]["panda_video_id"]


			elsif content_type == "image"
				
				media_object = params[:content][content_type]

				media_name = media_object.original_filename + trip.contents.length.to_s

				directory = "app/assets/images/"
				path = File.join(directory, media_name)
				File.open(path, "wb") { |f| f.write(media_object.read) }
				value = media_name
			elsif content_type == "text"
				puts "saving text"
				value = params[:content][:blog]
				other = params[:content][:blog_subject]
				latlng = params[:content][:latlng]
				city_name = params[:content][:city_name]
				Content.save_content("map", latlng, params[:trip_id], params[:content][:milestone_index], city_name);



			end
			puts "value is " + value 
			content = Content.save_content(content_type, value, params[:trip_id], params[:content][:milestone_index], other)

			if content_type == "video"
				start = Time.new
				while true 
					video = Content.find(content.id)
					original_video = content.panda_video
	        	 	h264_encoding = original_video.encodings["h264"]
        	 	
        	 		if h264_encoding.success? || Time.new.to_i - start.to_i > 20
        	 			break
        	 		end
        	 	end
			end

			flash[:notice] = "Media successfully uploaded!"
			
		else
			flash[:notice] = "No text or no user!"
		end

		redirect_to "/trip/layout/" + params[:trip_id].to_s + "?edit=true" + "#content_" + content.id.to_s

	end
    
    
    def add_milestone
        
        trip = Trip.find(params[:trip_id])
        newMilestoneIndex = params[:lastMilestone].to_i
        newMilestoneIndex += 1
        time = Time.new()
        
        for content in trip.contents
            if content.milestone_index >= newMilestoneIndex
                content.milestone_index = content.milestone_index + 1
                content.save()
            end
        end
        
        Content.save_content("milestone", "New Day", trip.id, newMilestoneIndex, "")
        urlForRedirect = "/trip/layout/" + params[:trip_id] + "?edit=true"
        redirect_to urlForRedirect
        
    end
    
    
    def changeMilestoneName
        puts "HERE"
        puts session["user"];
        trip = Trip.find(params[:id])
        milestone = trip.contents.find(params[:milestone])
        milestone.value = params[:newTitle]
        milestone.save()
        render :nothing => true
    end
    

	def layout

		if session["user"].nil?
			redirect_to "/splash/login"
			return
		end

		@trip_id = params[:id]

		puts "current user logged in is " + session["user"].to_s

		@user = User.find(session["user"])
		@trip = Trip.find(@trip_id)

        
        temp = Array.new()
        for content in @trip.contents

        	# if content.content_type == "video"
        	# 	original_video = content.panda_video
        	# 	h264_encoding = original_video.encodings["h264"]
        	# 	content.other = h264_encoding.url
        	# 	puts "in controller"
        	# 	puts content.other
        	# end

            index = content.milestone_index
            if index == nil
                index = 0
            end
            if temp[index] == nil
                temp[index] = Array.new()
            end
            temp[index] = temp[index].push(content)
        end
        
        @all_content = Array.new()
        for milestone in temp
            milestone.sort! { |a,b| a.trip_id <=> b.trip_id }
            @all_content.concat(milestone)
        end
        #temp = @trip.contents.sort { |a,b| a.trip_id <=> b.trip_id }
		#@all_content = temp.sort { |a,b| a.milestone_index <=> b.milestone_index }

		#@all_content = Content.find(:all)


	end
	def test
	end
end
