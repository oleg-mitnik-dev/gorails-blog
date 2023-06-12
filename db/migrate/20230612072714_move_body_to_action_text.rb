class MoveBodyToActionText < ActiveRecord::Migration[7.0]
  def change
    # Because our app is small and we don't have very many blog posts — we are going to do the migration of the blog post
    # content or body to content right here in the migration.
    # If you have a large application you'll actually want to do this in a multiple steps when you roll out change like this,
    # because it could take hours to migrate the data from one field to another and you might not want to wait hours to
    # deploy your application.
    # So our migration in our case are going to be very fast because we only have four blog posts or even less in production,
    # and this will be super quick so it's not a big deal.

    # #find_each will work like #each however it is going to grab batches of records and process them at a time.
    # So we will never load every blog post out of the database we'll load like a maximum of a thousand I think is what
    # #find_each does by default.
    # So it'll grab a thousand blog posts at a time, load them in a memory and then give you each one to operate on
    # where we will go and take the body and assign it to the content.
    # And after we're done saving each one of those we can drop that column from the database table.
    BlogPost.all.find_each do |blog_post|
      blog_post.update(content: blog_post.body)
    end

    remove_column :blog_posts, :body
  end
end
