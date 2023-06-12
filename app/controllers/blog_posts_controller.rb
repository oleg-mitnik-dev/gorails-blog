class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create] # only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show
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

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save then
      # Redirect to our new-created blog post
      redirect_to @blog_post
    else
      # 1. Render a #new action and just reuse the new.html.erb
      # and a @blog_post with already filled data
      # 2. :unprocessable_entity is a status code symblol
      # And now we are going to get an error responce of 422
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.puslished.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
