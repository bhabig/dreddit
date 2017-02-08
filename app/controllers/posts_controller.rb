class PostsController < ApplicationController
  before_action :logged_in?
  before_action :current_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else
        @posts = @user.posts
      end
    else
    @posts = Post.all
    end
  end

  def new
    @post = Post.new(user_id: current_user.id)
    @counter = 0
  end

  def create
    binding.pry
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @post = @user.posts.find_by(id: params[:id])
      if @post.nil?
        redirect_to user_posts_path(@user), alert: "Post not found"
      end
    else
      @post = Post.find(params[:id])
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :title, tag_ids:[], tag_attributes: [:tag_name])
  end

  def set_post
    @post ||= Post.find_by(id: params[:id])
  end
end
