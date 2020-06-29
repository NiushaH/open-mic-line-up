# Here is where I create some seed data to work with and signup associations



# Create 2 users

madonna = User.create(name: "Madonna", cellphone: 2025551212, password_digest: password1234)
tracy =  User.create(name: "Tracy Chapman", cellphone: 2125551212, password_digest: password1234)
taylor =  User.create(name: "Taylor Swift", cellphone: 6155551212, password_digest: password1234)


# Create some signups

Signup.create(song: "Cherish", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Signup.create(song: "Holiday", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Signup.create(song: "Fast Car", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Signup.create(song: "Talkin' 'Bout a Revolution", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Signup.create(song: "Should've Said No", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)
Signup.create(song: "The Outside", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)

