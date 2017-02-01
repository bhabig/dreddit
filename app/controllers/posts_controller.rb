class PostsController < ApplicationController
  before_action :logged_in?
  before_action :current_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.tags.build
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end

  def set_post
    @post ||= Post.find_by(id: params[:id])
  end
end
