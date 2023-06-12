class BlogPost < ApplicationRecord
  # Instead of having column on our model like we did with body, which is a text column,
  # has_rish_text is actually going to put it in a separate database table that Rails can manage completely.
  # And this is setting up an association between the two tables.
  # So we can get our blog post and it's going to be associated and have the actual blog post content somewhere else.
  # As part of this we can actually
  # 1. move our content that's already in our body column over to the new content field that we have with Rich Text.
  # Because they don't use the same name we can actually reference the old stuff.
  # 2. Then copy it over to the new content attribute,
  # 3. save that
  # 4. and we can get rid of the body and get rid of that entirely.
  # So that's we can do by creating a little migration to go and do that.
  # We could also just completely get rid of the body column as is and recreate the content ourselves because it's a
  # brand new blog and we don't have any existing data that we must keep.
  # So it is up to us to kind of decide how we want to do that.
  # If we want to keep it all we can do it that way or we could just get rid of it because we're in a brand new application
  # and we're free to make some bigger changes like that.
  # WE CHOOSE TO KEEP OUR DATA AROUND.
  # We can write a migration to copy existing body inforamation over to the new content attribute.
  # $ rails g migration MoveBodyToActionText
  has_rich_text :content

  validates :title, presence: true
  validates :body, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
