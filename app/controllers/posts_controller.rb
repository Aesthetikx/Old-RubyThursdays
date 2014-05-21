class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page],
                           per_page: params[:per_page]
                          ).order('date DESC')

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post = Post.find_using_slug params[:slug]
  end

end
