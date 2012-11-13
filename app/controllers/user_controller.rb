class UserController < ApplicationController

	def home
		curr = session["user"]
		puts "id is"
		puts curr

		user = User.find(curr)
		puts "user is "
		puts user

		puts "trips are"
		@trips = user.trips
		puts @trips

	end

	def trip

	end
end
