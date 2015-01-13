class SiteController < ApplicationController

  before_action :is_authenticated?


  def index
    @user = current_user
    # @user = User.find_by_id(session[:user_id])
    # redirect_to login_path unless @user

  end

  def taco
    @user = User.find_by_id(session[:user_id])

  end


end