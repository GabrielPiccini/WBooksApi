# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do 
    Book.create(
      title: Faker::Book.title,
      author: Faker::Book.author,
      image: Faker::Avatar.image,
      genre: Faker::Book.genre,
      publisher: Faker::Book.publisher,
      year: Faker::Date.between(from: '1900-09-23', to: '2020-09-25').year.to_s
    )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?