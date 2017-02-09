class UsersController < ApplicationController
  before_action :logged_in?, only: [:edit, :update, :show, :index, :destroy]
  before_action :current_user, only: [:edit, :update, :show, :index, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create #review amusement park lab to move logic into model
    if password? && matching_password?
      @user = User.new(user_params)
      @user.name_uniformity
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path, alert: "There was a problem creating an account with the information provided. Please try again"
      end
    else
      redirect_to new_user_path, alert: "Passwords did not match. Please re-enter"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def edit
    if params[:id].to_i == current_user.id
      render :edit
    else
      redirect_to :back, alert: "You can only edit your own account"
    end
  end

  def update
    eligible = @user.update_control(user_params)
    if eligible == true
      @user.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user), alert: "Invalid credentials. Please try again"
    end
  end

  def destroy
    binding.pry
    if params[:id].to_i == current_user.id
      @user = User.find_by(id: params[:id])
      @user.destroy
      session.destroy
      redirect_to new_user_path
    else
      redirect_to :back, alert: "You can only delete your own account"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def matching_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
