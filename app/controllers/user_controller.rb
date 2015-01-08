class UserController < ApplicationController
  def signup
  	@user = User.new
  end

  def login
    @user= User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:userid]=@user.id
      redirect_to "/task/home"
  	else
  		render "signup"
  	end
  end

  def authuser
    @user = User.find_by(username:auth_params[:username])
    if @user && @user.authenticate(auth_params[:password])
      session[:userid]=@user.id
      redirect_to "/task/home"
    else
      flash[:danger]="Username doesnt exist" if @user.nil?
      flash[:danger]="Password provided is wrong!" if !@user.nil?
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
  private
  def auth_params
    params.require(:user).permit(:username,:password)
  end
end
