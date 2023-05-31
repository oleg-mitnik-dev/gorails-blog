Rails.application.routes.draw do
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_pos
  root "blog_posts#index"
end
