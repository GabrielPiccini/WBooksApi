FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    image { Faker::Avatar.image }
    year { (Faker::Date.between(from: '1900-09-23', to: '2020-09-25')).to_s }
  end
end
