class SplashController < ApplicationController

	def index
		redirect_to :action => :login

	end

	def login

	end

	def post_login
		email = params[:email]
		password = params[:password]
		user = User.find_by_email(email)
		puts "in post login"
		if user == nil
			flash[:notice] = "Invalid username - please try again or sign up for an account"
			redirect_to :action => :login
		else
			puts user.first_name
			puts user.password
			if user.password_valid?(password)
				puts "password OK"
				session["user"] = user.id
				puts session["user"]
				redirect_to(:controller => :user, :action => :home, :id => user.id)
			else
				flash[:notice] = "Sorry, that username password combination is incorrect - please try again"
				redirect_to :action => :login
			end
		end

	end

	def register
		@user = User.new
	end

	def post_register
		puts params
		@user = User.new()
		@user.first_name = params[:first_name]
		@user.last_name = params[:last_name]
		@user.email = params[:email]
		@user.password = params[:password]

		if @user.valid?
			@user.save
			trip = Trip.new(:name => "New Trip", :user_id => @user.id, :cover_photo => "stock.jpg")
    		trip.save()
			session["user"] = @user.id
			redirect_to "/user/home/" + @user.id.to_s	
		else
			puts "ERRROORR"
			flash[:notice] = @user.errors.full_messages
			redirect_to "/splash/register"
		end
		
	end
end
