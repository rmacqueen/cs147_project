class TripController < ApplicationController
	def view

	end

	def layout
		@user = User.find_by_id(session["user"])
		puts @user
		@all_content = @user.contents
		for content in @all_content
			content.width = 200
			content.height = 200
		end	
		puts @all_content


	end
end
