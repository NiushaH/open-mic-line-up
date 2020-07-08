# Here is where I create some seed data to work with and performance associations

# Create 3 users

madonna = User.create(name: "Madonna", cellphone: "2025551212", password: "pw")
tracy =  User.create(name: "Tracy Chapman", cellphone: "2125551212", password: "pw")
taylor =  User.create(name: "Taylor Swift", cellphone: "6155551212", password: "pw")


# Create some performances

Performance.create(song: "Cherish", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Performance.create(song: "Holiday", artist: "Madonna", genre: "Pop", user_id: madonna.id)
Performance.create(song: "Fast Car", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Performance.create(song: "Talkin' 'Bout a Revolution", artist: "Tracy Chapman", genre: "Folk", user_id: tracy.id)
Performance.create(song: "Should've Said No", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)
Performance.create(song: "The Outside", artist: "Taylor Swift", genre: "Country", user_id: taylor.id)


# Use ActiveRecord to pre-associate data:

madonna.performances.create(song: "Music", artist: "Madonna", genre: "Pop")
tracy.performances.create(song: "Heaven's Here on Earth", artist: "Tracy Chapman", genre: "Folk")
taylor.performances.create(song: "Shake It Off", artist: "Taylor Swift", genre: "Pop")

madonna_performance = madonna.performances.build(song: "Frozen", artist: "Madonna", genre: "Pop")
madonna_performance.save

tracy_performance = tracy.performances.build(song: "Cold Feet", artist: "Tracy Chapman", genre: "Folk")
tracy_performance.save

taylor_performance = taylor.performances.build(song: "Fifteen", artist: "Taylor Swift", genre: "Pop")
taylor_performance.save
