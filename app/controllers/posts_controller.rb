class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page],
                           per_page: params[:per_page]).order('date DESC')
  end

  def show
    @post = Post.find params[:id]
  end
end
