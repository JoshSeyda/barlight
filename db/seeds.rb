# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: 'test@email.com' , password: 'password', handle: 'turnstile', first: 'turn', last: 'stile')
# @alex = User.create(email: 'alex@email.com' , password: 'password', handle: 'babiesinspace', first: 'babies', last: 'inspace')
# Role.create!(name: 'tender')
# @alex.add_role :tender

# 100.times do
#     User.create(email: Faker::Internet.unique.email, password: "password", first: Faker::Name.first_name, last: Faker::Name.last_name, handle: Faker::Internet.user_name)
# end

# @venue = Venue.create(title: "East River Bar")
# @venue.build_location(address: "97 S 6th St, Brooklyn, NY 11211").save
# @venue = Venue.create(title: 'KGB Bar')
# @venue.build_location(address: '85 E 4th St, New York, NY 10003').save
# @venue = Venue.create(title: 'The Summit Bar')
# @venue.build_location(address: '133 Avenue C, New York, NY 10009').save
# @venue = Venue.create(title: 'Living Room Bar & Terrace')
# @venue.build_location(address: '8 Albany St, New York, NY 10006').save
# @venue = Venue.create(title: 'One Mile House Bar')
# @venue.build_location(address: '10 Delancey St, New York, NY 10002').save
# @venue = Venue.create(title: 'Bar Veloce')
# @venue.build_location(address: '146 W Houston St, New York, NY 10012').save
# @venue = Venue.create(title: 'Vig Bar')
# @venue.build_location(address: '12 Spring St, New York, NY 10012').save
# @venue = Venue.create(title: 'BAR GOTO')
# @venue.build_location(address: '245 Eldridge St, New York, NY 10002').save
# @venue = Venue.create(title: 'Evening Bar')
# @venue.build_location(address: '85, Smyth Hotel, W Broadway, New York, NY 10007').save
# @venue = Venue.create(title: 'Apotheke')
# @venue.build_location(address: '9 Doyers St #1, New York, NY 10013').save
# @venue = Venue.create(title: '169 Bar')
# @venue.build_location(address: '169 E Broadway, New York, NY 10002').save
# @venue = Venue.create(title: 'Ace Bar')
# @venue.build_location(address: '531 E 5th St, New York, NY 10009').save
# @venue = Venue.create(title: 'RPM Bar')
# @venue.build_location(address: '266 Broome St, New York, NY 10013').save

10.times do
    @user = User.all.sample
    @user.add_role :tender   
    Schedule.create(user_id: @user.id) 
end

50.times do
    @user = User.with_role(:tender).sample
    @venue = Venue.find(1+rand(10))
    @rand =  1+rand(14)
    @user.schedule.events.create(title: @venue.title, start: DateTime.new(2018, 05, 25, @rand), end: DateTime.new(2018, 05, 25, @rand+6), color: ['red', 'black', 'green'].sample, light_on: [true, false].sample, venue_id: @venue.id)
end

100.times do
    @user = User.with_role(:tender).sample
    @customer = User.without_role(:tender).sample
    Regular.create(tender_id: @user.id, customer_id: @customer.id)
end

# Schedule.create(user_id: @alex.id) 
# 15.times do
#     @user = User.with_role(:tender).sample
#     @venue = Venue.find(1+rand(10))
#     @rand =  1+rand(14)
#     @rand2 = 1+rand(29)
#     @user.schedule.events.create(title: @venue.title, start: DateTime.new(2018, 05, @rand2, @rand), end: DateTime.new(2018, 05, @rand2, @rand+6), color: ['red', 'black', 'green'].sample, light_on: [true, false].sample, venue_id: @venue.id)
# end
# 30.times do
#     @customer = User.without_role(:tender).sample
#     Regular.create(tender_id: @alex.id, customer_id: @customer.id)
# end