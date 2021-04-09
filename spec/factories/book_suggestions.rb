FactoryBot.define do
  factory :book_suggestion do
    editorial { Faker::Name.last_name }
    price { Faker::Number.within(range: 10.0..999.99) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Avatar.image }
    publisher { Faker::Book.publisher }
    year { Faker::Date.between(from: '1900-09-23', to: '2020-09-25').year.to_s }
    user
  end
end
  