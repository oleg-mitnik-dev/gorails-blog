class BlogPosts::CoverImagesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  before_action :set_blog_post

  def destroy
    @blog_post.cover_image.purge_later

    respond_to do |format|
      format.html  { redirect_to edit_blog_post_path(@blog_post) }
      format.turbo_stream { render turbo-stream: turbo_stream.remove(dom_id(@blog_post, :cover_image)) }
    end
  end

  private

  def set_blog_post
    # that is because we had in nested routes and you'll see in routes :blog_post_id instead of just :id (see below)
    # `$ rails routes -g cover_image` #=> /blog_posts/:blog_post_id/cover_image
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end