class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :check_logged_in
  helper_method :get_user
  helper_method :check_logged_out
  helper_method :check_right_user
  
  protected 
	def check_right_user(user)
	  if session[:user_id] and (user == (User.find session[:user_id]))
		return true	
	  else
		redirect_to root_url
		return false
	  end
	end
	
	def check_logged_in
	  if session[:user_id] and User.find session[:user_id]
		return true	
	  else
		redirect_to root_url
		return false
	  end
	end
	
	
    def get_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def check_logged_out
	  if session[:user_id]
		redirect_to courses_url
		return false
	  else
		return true
	  end
	end
end
