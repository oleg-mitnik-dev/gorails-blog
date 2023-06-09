require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # draft

  test "draft returns true for draft blog post" do
    # it is a little slower because it is going to query the database for a fixture
    # but it also is really handy because we can use this for other tests in our code as well
    assert blog_posts(:draft).draft?
  end

  test "draft returns false for published blog post" do
    refute blog_posts(:published).draft?
  end

  test "draft returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end

  # published

  test "published returns true for published blog post" do
    assert blog_posts(:published).published?
  end

  test "published returns false for draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published returns false for scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end

  # scheduled

  test "scheduled returns true for scheduled blog post" do
    assert blog_posts(:scheduled)q.scheduled?
  end

  test "scheduled returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled returns false for published blog post" do
    refute blog_posts(:published).scheduled?
  end
end
