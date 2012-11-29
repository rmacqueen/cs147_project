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

	def change_cover
		curr = session["user"]
		
		media_object = params[:content][:image]
		trip = Trip.find(params[:content][:trip_id])

		directory = "app/assets/images/"
		path = File.join(directory, "cover_photo_" + trip.id.to_s)
		File.open(path, "wb") { |f| f.write(media_object.read) }

		trip.cover_photo = "cover_photo_" + trip.id.to_s

		trip.save();

		redirect_to "/user/home/" + curr.to_s
	end

	def delete_trip
		curr = session["user"]
		trip = Trip.find(params[:trip_id])
		trip.delete

		redirect_to "/user/home/" + curr.to_s
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
