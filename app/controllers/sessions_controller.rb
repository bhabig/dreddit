class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where("lower(name) = ?", params[:user][:name].downcase).first
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path, alert: "Could not find an account by those credentials. You must create an account first"
    end
  end

  def destroy
    if logged_in?
      session.destroy
      redirect_to root_path
    else
      render :show
    end
  end

end
