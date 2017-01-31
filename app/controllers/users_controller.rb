class UsersController < ApplicationController
  before_action :logged_in?, only: [:edit, :update, :show, :index, :destroy]
  before_action :current_user, only: [:edit, :update, :show, :index, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if password? && matching_password?
      @user = User.create(user_params)
      @user.name_uniformity
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_path, alert: "There was a problem creating an account with the information provided. Please try again"
      end
    else
      redirect_to new_user_path, alert: "Passwords did not match. Please re-enter"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])

  end

  private

  def matching_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation)
  end
end
