class PostsController < ApplicationController
  before_action :logged_in?
  before_action :current_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new(user_id: current_user.id)
    @counter = 0
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, alert: "could not create post"
    end
  end

  def show
    if @post
      @user = User.find_by(id: @post.user_id)
      render :show
    else
      redirect_to :back, alert: "could not find post"
    end
  end

  def edit
    if current_user.id == @post.user_id
      render :edit
    else
      redirect_to :back, alert: "you are not authorized to edit this post"
    end
  end

  def update
    @post = Post.update(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :edit, alert: "could not update post"
    end
  end

  def destroy
    if @post && @post.user_id == current_user.id
      @post.destroy
      redirect_to user_path(current_user)
    else
      render :show, alert: "could not delete post"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :title, tag_ids: [], :tag_attributes=>[:name_1, :name_2, :name_3])
  end

  def set_post
    @post ||= Post.find_by(id: params[:id])
  end
end
