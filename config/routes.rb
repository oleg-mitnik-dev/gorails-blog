Rails.application.routes.draw do
  # Rails routes are matched in the order they are specified
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  root "blog_posts#index"
end
