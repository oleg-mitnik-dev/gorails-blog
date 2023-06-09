require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # draft

  test "draft returns true for draft blog post" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  # published

  test "published returns true for published blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published returns false for draft blog post" do
    refute BlogPost.new(published_at: nil).published?
  end

  test "published returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end

  # scheduled

  test "scheduled returns true for scheduled blog post" do
    assert BlogPost.new(published_at: 1.year.from_now).scheduled?
  end

  test "scheduled returns false for draft blog post" do
    refute BlogPost.new(published_at: nil).scheduled?
  end

  test "scheduled returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).scheduled?
  end
end
