class SplashController < ApplicationController

	def index
		redirect_to :action => :login

	end

	def login

	end

	def post_login
		email = params[:text_val]
		password = params[:password]
		user = User.find_by_email(email)
		if user == nil
			flash[:notice] = "No user exists with that username - please try again"
			redirect_to :action => :login
		else
			puts user.first_name
			puts user.password
			if user.password_valid?(password)
				session["user"] = user.id
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
		@user = User.new(params[:user])
		if @user.valid?
			puts "right here"
			@user.save
			flash[:notice] = "Thanks #{@user.first_name}! Your account was successfully created!! Please login below:"
			redirect_to :action => :login	
		else
			puts "ERRROORR"
			flash[:notice] = @user.errors.full_messages
			redirect_to :action => :register
		end
		
	end
end
