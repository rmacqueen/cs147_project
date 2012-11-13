class TripController < ApplicationController
	def view

	end

	def new_trip
		trip = Trip.new(:cover_photo => "bieber1.jpg", :name => "New Trip", :user_id => session["user"])
		trip.save()
		time = Time.new()
		day = Content.new(:date_time => time, :value => "New Day", :trip_id => trip.id, :content_type => "milestone")
		day.save()
		
		redirect_to "/trip/layout/" + trip.id.to_s
	end

	def add
		puts "in trip add"
		puts session["user"]

	end

	def post_add
		puts "In post_add"
		puts session["user"]
		user = User.find(session["user"])
		puts params
		trip = Trip.find(params[:trip_id])
		if params[:content] != nil
			puts "saving photo"
			photo_object = params[:content][:photo]
			photo_name = photo_object.original_filename + trip.contents.length.to_s
			puts "name is: "
			puts photo_name
			puts "trip is is"
			puts params[:trip_id]
			directory = "app/assets/images/"
			path = File.join(directory, photo_name)
			File.open(path, "wb") { |f| f.write(photo_object.read) }
			Content.save_content("image", photo_name, params[:trip_id], "")

			flash[:notice] = "Photo successfully uploaded!"
			
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
			Content.save_content("image", photo_name, 1, "")

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

		curr = session["user"]
		puts "curr"
		puts curr

		trip_id = params[:id]
		puts "trip"
		puts trip_id

		if session["user"].nil?
			redirect_to "/splash/login"
		end

		puts "current user logged in is " + session["user"].to_s

		@user = User.find(session["user"])
		@trip = Trip.find(trip_id)
		puts "trip"
		puts @trip
		@all_content = @trip.contents

		#@all_content = Content.find(:all)


	end
end
