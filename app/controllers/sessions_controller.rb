class SessionsController < ApplicationController
	skip_before_filter :set_user

	def new
		check_logged_out
	end

	def create
		@user = User.find_by email: params[:email]
		if @user
			if @user.email_needs_validated 
		  		validate
		  	elsif @user.locked
		  		lock
		  	else 
		  		sucess = User.authenticate(params[:email], params[:password])
		  		if sucess
		  			sucessful_login					
		  		else		  			
		  			unsucessful_login
		  		end
			end		 
		 else
		 	unsucessful_login		  			
		 end
	end


	def destroy
	  session[:user_id] = nil
	  redirect_to root_url
	end

	private

	def lock
		@user.locked = true
		@user.save		
	  	Mailer.lock_email(@user).deliver
	  	redirect_to root_url, :notice => "Your account has been locked. Check your email for instructions to unlock."
	end

	def validate 		
	  	Mailer.validation_email(@user).deliver
	  	redirect_to root_url, :notice => "Your Email must be validated before you can log in. Check your email for a validation link."
	end

	def sucessful_login
		session[:user_id] = @user.id
		redirect_to courses_url
		@user.login_attempts = 0
		@user.save
	end

	def unsucessful_login
		if @user
			@user.login_attempts += 1
	  		@user.save
	  		if @user.login_attempts >= 3
	  			lock
	  			return#exit so not rendered twice 
	  		end
	  	end
		flash.now.alert = "Invalid email or password"
		render "new"
	end
end
