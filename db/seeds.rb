require 'faker'

puts 'Cleaning database...'

Attendee.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all
Badge.destroy_all

puts 'Creating seed'

#   User.create

user_attributes = [
{
  first_name: 'Kevin',
  last_name: 'Joya',
  email: 'kevin.joya@outlook.com',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/kvin3324',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/k%C3%A9vin-joya-5b6250133/',
  city: 'Bordeaux',
  bio: Faker::Lorem.sentence(3),
  job: 'Sofa tester'
},
{
  first_name: 'Nicolas',
  last_name: 'Béjenne',
  email: 'nicolas.bejenne@gmail.com',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/nbejenne',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/nicolas-b%C3%A9jenne-7005518b/',
  city: 'Paris',
  bio: Faker::Lorem.sentence(3),
  job: 'Chocolate Beer Expert'
},
{
  first_name: 'Paul',
  last_name: 'Quintrie',
  email: 'paul.quintrie.lamothe@hotmail.fr',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/pquintrie',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/paul-quintrie-lamothe-50ab43b2/  ',
  city: 'Scorbé-Clairvaux',
  bio: Faker::Lorem.sentence(3),
  job: 'Wizard'
},
{
  first_name: 'Jean-Baptiste',
  last_name: 'Camaret',
  email: 'jbaptiste.camaret@gmail.com',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/kvin3324',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/jean-baptiste-camaret-ba621322/',
  city: 'London',
  bio: Faker::Lorem.sentence(3),
  job: 'Bread Scientist'
}
]

User.create!(user_attributes)


user1 = User.new(
  first_name: 'Arthur',
  last_name: "D'Huy",
  email: 'a.dhuy@orange.fr',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/led8',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/arthur-d-huy-849b62a2/',
  city: 'Bordeaux',
  bio: Faker::Lorem.sentence(3),
  job: 'Jurist'
)

user2 = User.new(
  first_name: 'Diego',
  last_name: 'Bolettieri',
  email: 'diego@bebetterhotels.comm',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/diegobolettieri/',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/k%C3%A9vin-joya-5b6250133/',
  city: 'Santiago',
  bio: Faker::Lorem.sentence(3),
  job: 'Entrepreneur'
)

drink = Category.new(
    name: 'drink',
    picto: 'drink.png'
  )
meal = Category.new(
    name: 'meal',
    picto: 'meal.png'
  )

category_attributes = [
  {
    name: 'movie',
    picto: 'movie.png'
  },
  {
    name: 'sport',
    picto: 'sport.png'
  },
  {
    name: 'music',
    picto: 'music.png'
  },
  {
    name: 'sightseeing',
    picto: 'sightseeing.png'
  }
]

Category.create!(category_attributes)



event_attributes = [
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '107 Cours Balguerie Stuttenberg, 33300 Bordeaux',
    private: false,
    name: 'Poker night',
    description: Faker::Lorem.sentence(3),
    category: drink,
    user: user1
  },
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '9 Place Fernand Lafargue, 33000 Bordeaux',
    private: false,
    name: 'Diner at Kokomo',
    description: Faker::Lorem.sentence(3),
    category: meal,
    user: user2
  }
]

Event.create!(event_attributes)

attendees_attributes = [
  {
    user: User.first,
    event: Event.first
  },
  {
    user: User.second,
    event: Event.first
  },
  {
    user: User.third,
    event: Event.first
  },
  {
    user: User.fourth,
    event: Event.first
  }
]

Attendee.create!(attendees_attributes)

puts 'Finished!'
