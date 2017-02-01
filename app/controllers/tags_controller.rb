class TagsController < ApplicationController
  before_action :logged_in?
  before_action :current_user
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end
end
