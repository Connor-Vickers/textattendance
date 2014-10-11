class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.email == "hvicker@purdue.edu" 
      if @user.save
        session[:user_id] = @user.id
        redirect_to courses_url
      else
      render "new"
      end
    else
      redirect_to root_url, :notice => 'At this time Text Attendance only open to beta users.'
    end
	end
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
