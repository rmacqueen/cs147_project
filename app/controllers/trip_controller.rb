class TripController < ApplicationController
	def view

	end

	def new_trip
		@result = params[:blog]
	end

	def add
		puts "in trip add"
		puts session["user"]

	end

	def post_add_image
		puts "In post_add_image"
		puts session["user"] = 1 #hard coded
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
		
		redirect_to "/trip/add_image"

	end

	def post_add

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
		session["user"] = 1;

		if session["user"].nil?
			redirect_to "/splash/login"
		end

		puts "current user logged in is " + session["user"].to_s

		@user = User.find_by_id(session["user"])
		@all_content = @user.contents

		@all_content = Content.find(:all)


	end
end
