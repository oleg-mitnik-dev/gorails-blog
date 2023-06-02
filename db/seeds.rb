# The way we wrote it here instead of using "> User.create" is going to allow us to rerun this without errors.
# So if we run it first time will not find the user in the database, and it will create one with this password and email address.
# If we run it again it's going to look up the record in the database, and then update it with the new password.
# So we can un it many times and it's not going to throw any errors. Which is nice!
# So we want our seeds to be repeatable like that.

# We will look up a user in the database with that email
# or will create a new one in memory: initiallize a new one in memory
user = User.where(email: "example@gmail.com").first_or_initialize

# And we can update the user with a new password
# update! thow an exception instead of just returning false
user.update!(
  password: "p4ssw0rd",
  password_confirmation: "p4ssw0rd"
)
