class PasswordsController < ApplicationController

  def create
    @user = User.find_by_email(params[:user][:email])

    @user.set_password_reset if @user

    flash[:warning] = "Password Reset Sent"
    redirect_to login_path
  end

  def edit
    @user = User.find_by_reset_code(params[:code])

  end

  def update
    @user = User.find_by_reset_code(params[:code])
    @user.password = params[:password]
    @user.save

    redirect_to login_path


  end


end