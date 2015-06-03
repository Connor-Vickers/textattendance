class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :check_logged_out

  before_filter :set_user, except: :home
  
  def home
  	if session[:user_id]
      redirect_to courses_url
    end
  end
  
  protected 

  def check_logged_out
    if session[:user_id]
	  redirect_to courses_url
	end
  end

  private

  def set_user
    if session[:user_id] 
      @user = User.find session[:user_id]
    else
      redirect_to root_url
    end
  end
end
