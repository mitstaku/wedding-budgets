FactoryBot.define do
  factory :event do
    association :user
    name                  { Faker::Name.name }
    event_date            { Faker::Date.forward(days: 30) }
  end
end
