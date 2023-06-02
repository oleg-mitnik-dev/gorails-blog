Rails.application.routes.draw do
  # This is a special route that allows all of those devise
  # sign-up links and login links and edit-your-profile links
  devise_for :users

  resources :blog_posts

  root "blog_posts#index"
end
