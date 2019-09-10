# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
friends = [
  { name: 'Chandler', phone_number: '5555555', description: 'description1' },
  { name: 'Phoebe', phone_number: '5555556', description: 'description2' },
  { name: 'Monica', phone_number: '5555557', description: 'description3' },
  { name: 'Ross', phone_number: '5555558', description: 'description4' },
  { name: 'Joey', phone_number: '5555559', description: 'description5' },
  { name: 'Rachel', phone_number: '5555560', description: 'description6' },
]

friends.each do |friend|
  Customer.where(name: friend[:name],
                 phone_number: friend[:phone_number],
                 description: friend[:description]).first_or_create!
end