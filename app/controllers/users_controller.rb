class UsersController < ApplicationController
    before_action :auth_user, only: [:validate, :unlock, :reset_password]
    skip_before_filter :set_user

	def new
    check_logged_out
	  @newuser = User.new
	end

	def create
	  @newuser = User.new(user_params)

	  if @newuser.email == "hvicker@purdue.edu" or  @newuser.email == "connorvic97@gmail.com" or @newuser.email == "remind"
      if @newuser.save
        Mailer.validation_email(@newuser).deliver
        redirect_to root_url, :notice => 'An Email has been sent to ' + @newuser.email + ' follow the link to validate your email and sign in.'
      else
        render "new"
      end
    else
      redirect_to root_url, :notice => 'At this time Text Attendance only open to beta users.'
    end
	end

  def validate
    session[:user_id] = @user.id
    @user[:email_needs_validated] = false
    @user.save
    redirect_to courses_url,  :notice => 'Thanks. Your Email has been successfully validated'
  end

  def unlock
    @user[:locked] = false
    @user.save
    redirect_to sign_in_url,  :notice => 'Thanks. Your account has been unlocked.'
  end

  def reset_password
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :q)#q is key from users vailidation email
    end

    def auth_user
      @user = User.find_by auth_token: params[:q]
      if !@user
        raise ActionController::RoutingError.new('Bad Link') 
      end
    end
end
