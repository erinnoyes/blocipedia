require 'faker'

User.create!(
  email: 'admin@admin.com',
  password: 'password',
  role: :admin
)

User.create!(
  email: 'standard@standard.com',
  password: 'password',
)

User.create!(
  email: 'premium@premium.com',
  password: 'password',
  role: :premium
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
end

users = User.all

20.times do
  Wiki.create!(
    title: Faker::Simpsons.character,
    body: Faker::Simpsons.quote,
    private: [true, false].sample,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{Wiki.count} wikis"
puts "#{User.count} users"
