class TripController < ApplicationController
	def view

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
		puts session
		puts session["user"]
		puts params[:textarea]
		if params[:textarea] != nil
			puts "saving blog post"
			blog = params[:textarea]
			Content.save_content("text", blog, 1, "")
			flash[:notice] = "Content successfully uploaded!: " + blog
			
		else
			flash[:notice] = "No text or no user!"
		end
		
		redirect_to "/trip/add"

	end

	def layout
		session["user"] = 1;

		if session["user"].nil?
			redirect_to "/splash/login"
		end

		puts "current user logged in is " + session["user"].to_s

		@user = User.find_by_id(session["user"])
		puts @user
		@all_content = @user.contents

		@all_content = Content.find(:all)
		puts "starting to iterate over all content"
		for content in @all_content

			puts "printing content width"
			puts content.width

			puts "printing content type"
			puts content.content_type

		end	
		puts @all_content


	end
end
