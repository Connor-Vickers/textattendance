class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	  	if user.email_check #was not set to nil when validated
	  		redirect_to root_url, :notice => "Your Email must be validated before you can log in. Check your email for a validation link."
	  		@user = user  		
	  		Mailer.validation_email(@user).deliver

	  	else
			session[:user_id] = user.id
			redirect_to courses_url
		end
	  else
		flash.now.alert = "Invalid email or password"
		render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url
	end
end
