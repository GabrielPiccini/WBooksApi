FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Alphanumeric.alpha(number: 10) }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
  end
end
