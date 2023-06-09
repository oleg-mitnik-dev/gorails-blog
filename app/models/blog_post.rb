class BlogPost < ApplicationRecord
  # Make sure our fields can't be an empty string or nil
  # Otherwise call error when we try to call @blog_post.save
  validates :title, presence: true
  validates :body, presence: true

  # The lambda allows us to evaluate this every time we make a query for
  # BlogPost.scheduled,
  # BlogPost.published,
  # BlogPost.draft
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }
end
