class BlogPost < ApplicationRecord
  # Make sure our fields can't be an empty string or nil
  # Otherwise call error when we try to call @blog_post.save
  validates :title, presence: true
  validates :body, presence: true
end
