class TripController < ApplicationController
	def view

	end

	def add

	end

	def post_add

		if params[:photo] != nil
			photo_object = params[:photo]
			puts photo_object
			photo_name = photo_object.original_filename
			directory = "app/assets/images/"
			path = File.join(directory, photo_name)
			File.open(path, "wb") { |f| f.write(photo_object.read) }
			Content.save_photo("image", photo_name, session["user"], "")

			flash[:notice] = "Photo successfully uploaded!"
		else
			flash[:notice] = "No file selected."
		end

	end

	def layout
		puts "current user logged in is " + session["user"].to_s

		if session["user"].nil?
			redirect_to "/splash/login"
		end

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
