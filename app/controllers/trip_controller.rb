class TripController < ApplicationController
	def view

	end

	def new_trip
		trip = Trip.new(:cover_photo => "bieber1.jpg", :name => "New Trip", :user_id => session["user"])
		trip.save()
		time = Time.new()
		day = Content.new(:date_time => time, :value => "New Day", :trip_id => trip.id, :content_type => "milestone", :milestone_index => 0)
		day.save()
		
		redirect_to "/trip/layout/" + trip.id.to_s
	end

	def add
		puts "in trip add"
		puts session["user"]

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
		puts session["user"]
		user = User.find(session["user"])
		puts params
		trip = Trip.find(params[:trip_id])
		
		if params[:content] != nil
			puts "saving content"
			content_type = params[:content][:content_type]
			value = ""

			if content_type == "video"
				puts "saving a video"
				value = params["video"]["panda_video_id"]

			elsif content_type == "image"
				
				media_object = params[:content][content_type]

				media_name = media_object.original_filename + trip.contents.length.to_s
				puts "name is: "
				puts media_name
				puts "trip is"
				puts params[:trip_id]
				directory = "app/assets/images/"
				path = File.join(directory, media_name)
				File.open(path, "wb") { |f| f.write(media_object.read) }
				value = media_name
			end
			puts "value is " + value 
			Content.save_content(content_type, value, params[:trip_id], params[:content][:milestone_index], "")

			flash[:notice] = "Media successfully uploaded!"
			
		else
			flash[:notice] = "No text or no user!"
		end
		
		redirect_to "/trip/layout/" + params[:trip_id].to_s

	end

	def post_add_image
		puts "In post_add"
		puts session["user"]
		user = User.find(session["user"])
		if params[:content] != nil
			puts "saving photo"
			photo_object = params[:content][:photo]
			photo_name = photo_object.original_filename + user.contents.length.to_s
			puts "name is: "
			puts photo_name
			directory = "app/assets/images/"
			path = File.join(directory, photo_name)
			File.open(path, "wb") { |f| f.write(photo_object.read) }
			Content.save_content("image", photo_name, 1, params[:milestone_index], "")

			flash[:notice] = "Photo successfully uploaded!"
			
		else
			flash[:notice] = "No text or no user!"
		end
		
		redirect_to "/trip/layout/6"

	end

	def post_add_text

		puts "In post_add"
		puts session["user"]
		if params[:textarea] != nil
			puts "saving blog post"
			blog = params[:textarea]
			Content.save_content("text", blog, 1, "")
			flash[:notice] = "Content successfully uploaded!: " + blog
			redirect_to :controller => "trip", :action => "new_trip", :params => {:blog => blog}
			
		else
			flash[:notice] = "Please enter text"
			redirect_to "/trip/add"
		end
		
		
	end

	def layout

		trip_id = params[:id]


		if session["user"].nil?
			redirect_to "/splash/login"
		end

		puts "current user logged in is " + session["user"].to_s

		@user = User.find(session["user"])
		@trip = Trip.find(trip_id)

        
        temp = Array.new()
        for content in @trip.contents
            index = content.milestone_index
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
