class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path
  end

  def new
    # Create a new blog post in a memory but not save it to the database
    # It will just be completely empty.
    # And we can use this to give to Rails to generate a form.
    # And Rails will take the form fields and match them to the correct database columns for us.
    @blog_post = BlogPost.new
  end
end
