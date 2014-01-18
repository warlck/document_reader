class SessionsController < ApplicationController
	def new
		expires_in 24.hours
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			login @user, params[:remember_me]
			redirect_to root_path
			#debugger
		else
			flash.now.alert = "Email or password is invalid"
			render :new
		end
	end


	def destroy
		cookies.delete(:auth_token)
		redirect_to root_path
	end

	
end

