# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.delete_all
teams = Team.create(
  [
    { name: 'Real Madrid Football Club' },
    { name: 'FC Barcelona', abbreviation: 'Barca' },
    { name: 'Bayern Munich', abbreviation: 'FCB' }
  ]
)

200.times do
  Team.create(name: Faker::Sports::Football.team)
end

Manager.create(
  [
    { first_name: Faker::FunnyName.name.split(' ').first,
      last_name: Faker::FunnyName.name.split(' ').last,
      age: Faker::Number.between(from: 40, to: 60),
      team_id: teams[0].id },
    { first_name: Faker::FunnyName.name.split(' ').first,
      last_name: Faker::FunnyName.name.split(' ').last,
      age: Faker::Number.between(from: 40, to: 60),
      team_id: teams[1].id },
    { first_name: Faker::FunnyName.name.split(' ').first,
      last_name: Faker::FunnyName.name.split(' ').last,
      age: Faker::Number.between(from: 40, to: 60),
      team_id: teams[2].id }
  ]
)
