class TripController < ApplicationController
	def view

	end

	def layout

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
