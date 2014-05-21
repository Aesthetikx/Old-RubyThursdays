class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page],
                           per_page: params[:per_page]
                          ).order('date DESC')

    if params[:tag]
      @posts = @posts.tagged_with(params[:tag])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post = Post.find_using_slug params[:slug]
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
    render partial: 'shared/tag_cloud'
  end

end
