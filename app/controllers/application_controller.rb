class ApplicationController < ActionController::Base
  # This is going to make pagy available to all of our controllers
  include Pagy::Backend
end


