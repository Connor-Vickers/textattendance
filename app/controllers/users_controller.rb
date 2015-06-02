class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)
    @user.email_check = (1000 + Random.rand(100000)).to_s

	  #if @user.email == "hvicker@purdue.edu" or  @user.email == "connorvic97@gmail.com" or @user.email == "mit"
      if @user.save
        Mailer.validation_email(@user).deliver
        redirect_to root_url, :notice => 'An Email has been sent to ' + @user.email + ' follow the link to validate your email and sign in.'
      else
        render "new"
      end
    #else
    #  redirect_to root_url, :notice => 'At this time Text Attendance only open to beta users.'
    #end
	end

  def validate
    @user = User.find_by email_check: params[:q]
    if @user
      @user[:email_check] = nil
      @user.save
      session[:user_id] = @user.id
      redirect_to courses_url,  :notice => 'Thanks. Your Email has been successfully validated'
    end
  end
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :q)#q is key from users vailidation email
    end
end
