class PasswordsController < ApplicationController

  def create
    @user = User.find_by_email(params[:user][:email])

    @user.set_password_reset if @user
    UserMailer.password_reset(@user).deliver

    flash[:warning] = "Password Reset Sent"
    redirect_to login_path
  end

  def edit
    @user = User.find_by_reset_code(params[:code])


  end

  def update
    # render :json => params
    @user = User.find_by_reset_code(params[:code])
    @user.password = params[:user][:password]
    @user.save

    flash[:success] = "Password Changed!"

    redirect_to login_path


  end


end