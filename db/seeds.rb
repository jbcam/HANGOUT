require 'faker'

puts 'Cleaning database...'

Event.destroy_all
User.destroy_all
Category.destroy_all
Badge.destroy_all

puts 'Creating seed'

# category create

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
  },
  {
    name: 'drink',
    picto: 'drink.png'
  },
  {
    name: 'meal',
    picto: 'meal.png'
  }
]

Category.create!(category_attributes)


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
  job: 'Sofa tester',
  category: Category.first
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
  job: 'Chocolate Beer Expert',
  category: Category.second

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
  job: 'Wizard',
  category: Category.third
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
  job: 'Bread Scientist',
  category: Category.fourth
}
]

User.create!(user_attributes)


badge_attributes = [
  {
    name: 'newcommer',
    logo: 'badge_1.png',
  },
  {
    name: 'regular',
    logo: 'badge_2.png',
  },
  {
    name: 'leader',
    logo: 'badge_3.png',
  },
  {
    name: 'Ambasador',
    logo: 'badge_4.png',
  }
]

Badge.create!(badge_attributes)

event_attributes = [
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '107 Cours Balguerie Stuttenberg, 33300 Bordeaux',
    private: false,
    name: 'Poker night',
    description: Faker::Lorem.sentence(3),
    category: Category.first,
    user: User.first
  },
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '9 Place Fernand Lafargue, 33000 Bordeaux',
    private: false,
    name: 'Diner at Kokomo',
    description: Faker::Lorem.sentence(3),
    category: Category.second,
    user: User.second
  }
]

Event.create!(event_attributes)

puts 'Finished!'
