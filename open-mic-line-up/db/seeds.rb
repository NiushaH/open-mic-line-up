# Here is where I create some seed data to work with and signup associations



# Create 2 users

madonna = User.create(name: "Madonna", cellphone: "2025551212", password_digest: "password1234")
tracy =  User.create(name: "Tracy Chapman", cellphone: "2125551212", password_digest: "password1234")
taylor =  User.create(name: "Taylor Swift", cellphone: "6155551212", password_digest: "password1234")


# Create some signups

Signup.create(song: "Cherish", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Signup.create(song: "Holiday", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Signup.create(song: "Fast Car", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Signup.create(song: "Talkin' 'Bout a Revolution", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Signup.create(song: "Should've Said No", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)
Signup.create(song: "The Outside", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)


# Use ActiveRecord to pre-associate data:

madonna.signups.create(song: "Music", artist: "Madonna", genre: "Pop")
tracy.signups.create(song: "Heaven's Here on Earth", artist: "Tracy Chapman", genre: "Folk")
taylor.signups.create(song: "Shake It Off", artist: "Taylor Swift", genre: "Pop")

madonna_signup = madonna.signups.create(song: "Frozen", artist: "Madonna", genre: "Pop")
madonna_signup.save

tracy_signup = tracy.signups.create(song: "Cold Feet", artist: "Tracy Chapman", genre: "Folk")
tracy_signup.save

taylor_signup = taylor.signups.create(song: "Fifteen", artist: "Taylor Swift", genre: "Pop")
taylor_signup.save
