FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { Faker::Internet.email }
    password              { 'aaa111' }
    password_confirmation { 'aaa111' }
  end
end
