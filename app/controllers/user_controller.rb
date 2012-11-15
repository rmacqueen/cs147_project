class UserController < ApplicationController

	def home
		curr = session["user"]
		puts "id is"
		puts curr
		if curr == nil
			redirect_to "/splash/login"
		else
			user = User.find(curr)
			puts "user is "
			puts user.first_name

			puts "trips are"
			@trips = user.trips
			puts @trips
		end

	end

	def home_alt
		curr = session["user"]
		puts "id is"
		puts curr

		user = User.find(curr)
		puts "user is "
		puts user.first_name

		puts "trips are"
		@trips = user.trips
		puts @trips
	end

	def trip

	end

	def settings
		puts session["user"]
		@user = User.find(session["user"])
		puts @user.first_name
	end

	def logout
		session["user"] = nil;
		redirect_to "/splash/"
	end
end
