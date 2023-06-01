Rails.application.routes.draw do
  # Rails routes are matched in the order they are specified
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post

  # Rails path helpers does not care about request type
  # So we can have :blog_post name only on a single one request
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  patch "/blog_posts/:id", to: "blog_posts#update"

  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts

  root "blog_posts#index"
end
