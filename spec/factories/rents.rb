FactoryBot.define do
  factory :rent do
    user
    book
    from { Faker::Date.backward(days:30) }
    to { Faker::Date.forward(days:30) }
  end
end