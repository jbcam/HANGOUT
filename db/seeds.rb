require 'faker'

puts 'Cleaning database...'

Attendee.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all
Badge.destroy_all
Conversation.destroy_all

puts 'Creating seed'

# category create

category_attributes = [
  {
    name: 'movie',
    picto: 'fas fa-film'
  },
  {
    name: 'sport',
    picto: 'fas fa-dumbbell'
  },
  {
    name: 'music',
    picto: 'fas fa-music'
  },
  {
    name: 'sightseeing',
    picto: 'fas fa-university'
  },
  {
    name: 'drink',
    picto: 'fas fa-glass-martini'
  },
  {
    name: 'meal',
    picto: 'fas fa-utensils'
  }
]

Category.create!(category_attributes)

# User.create

user_attributes = [
{
  first_name: 'Kevin',
  last_name: 'Joya',
  email: 'kevin.joya@outlook.com',
  remote_avatar_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEQC_3saaJjs72teIiASOfaqkc7r0M_QMcTiFfRI1RHDZnmUCV',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/k%C3%A9vin-joya-5b6250133/',
  city: 'Bordeaux',
  bio: Faker::Lorem.sentence(3),
  job: "Le flic d'Hendaye",
  category: Category.first,
  latitude: 44.8347567,
  longitude: -0.5750013
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
  category: Category.second,
  latitude: 44.8315907,
  longitude: -0.6844575
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
  category: Category.third,
  latitude: 44.859351,
  longitude: -0.5681261
},
{
  first_name: 'Paul-Antoine',
  last_name: 'Hocke',
  email: 'pahocke@gmail.com',
  remote_avatar_url: 'https://avatars3.githubusercontent.com/u/42313408?v=4',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/paul-quintrie-lamothe-50ab43b2/  ',
  city: 'Bordeaux',
  bio: Faker::Lorem.sentence(3),
  job: 'Data Analyst',
  category: Category.third,
  latitude: 44.859351,
  longitude: -0.5681261
},
{
  first_name: 'Jean-Baptiste',
  last_name: 'Camaret',
  email: 'jbaptiste.camaret@gmail.com',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/jbcam',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/jean-baptiste-camaret-ba621322/',
  city: 'London',
  bio: Faker::Lorem.sentence(3),
  job: 'Bread Scientist',
  category: Category.fourth,
  latitude: 44.8268667,
  longitude: 0.5744507
},
{
  first_name: 'Arthur',
  last_name: "D'Huy",
  email: 'a.dhuy@orange.fr',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/led8',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/arthur-d-huy-849b62a2/',
  city: 'Bordeaux',
  bio: Faker::Lorem.sentence(3),
  job: 'Jurist',
  category: Category.first,
  latitude: 44.8268667,
  longitude: -0.5744507
},
{
  first_name: 'Diego',
  last_name: 'Bolettieri',
  email: 'diego@bebetterhotels.comm',
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/DieBole',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/k%C3%A9vin-joya-5b6250133/',
  city: 'Santiago',
  bio: Faker::Lorem.sentence(3),
  job: 'Entrepreneur',
  category: Category.first,
  latitude: 46.8127079,
  longitude: 0.5397638
},
{
  first_name: 'Inès',
  last_name: 'Mokaddem',
  email: 'imokkadem@gmail.comm',
  remote_avatar_url: 'https://avatars1.githubusercontent.com/u/25454502?v=4',
  password:'azerty',
  linkedin: 'https://www.linkedin.com/in/ines-mokaddem/?originalSubdomain=fr',
  city: 'Bordeaux',
  bio: "Passionnée d'Instagram, j'ai décidé de devenir influenceuse #BIZZYTROPCOOL",
  job: 'Influenceuse',
  category: Category.second,
  latitude: 44.8347567,
  longitude: -0.5750013
}
]

User.create!(user_attributes)

# badges
badges_attributes = [
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
  }
]

Badge.create!(badges_attributes)

# events

event_attributes = [
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '107 Cours Balguerie Stuttenberg, 33300 Bordeaux',
    private: false,
    name: 'Poker night',
    description: "Tournoi de poker Texas Holdem",
    category: Category.first,
    user: User.first
  },
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: '9 Place Fernand Lafargue, 33000 Bordeaux',
    private: false,
    name: 'Diner at Kokomo',
    description: "Burger et cheese fries",
    category: Category.second,
    user: User.second
  },
   {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: 'Cours Jules Ladoumegue, 33300 Bordeaux',
    private: false,
    name: 'Finale de Champions League',
    description: "Bordeaux - Real Madrid",
    category: Category.second,
    user: User.second
  },
  {
    starts_at: DateTime.now.change({ hour: 19, min: 0, sec: 0 }),
    ends_at: DateTime.now.change({ hour: 23, min: 0, sec: 0 }),
    address: 'Place de la Comédie, 33000 Bordeaux',
    private: false,
    name: 'Beethoven Concerto',
    description: "Etre en avance",
    category: Category.second,
    user: User.second
  }
]

Event.create!(event_attributes)

# attendees

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
