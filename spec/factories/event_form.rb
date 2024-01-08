FactoryBot.define do
  factory :event_form do
    version_number        { Faker::Number.between(from: 1, to: 10) }
    detail                { 'test' }
    cost                  { Faker::Number.between(from: 1000, to: 10_000) }
    input_date            { '2022-01-01' }
    ceremony_type         { 'test' }
    ceremony_cost         { Faker::Number.between(from: 1000, to: 10_000) }
    adult_count           { Faker::Number.between(from: 1, to: 10) }
    child_count           { Faker::Number.between(from: 1, to: 10) }
    food_type             { 'test' }
    food_cost             { Faker::Number.between(from: 1000, to: 10_000) }
    venue_type            { 'test' }
    venue_cost            { Faker::Number.between(from: 1000, to: 10_000) }
    costume_type          { 'test' }
    costume_cost          { Faker::Number.between(from: 1000, to: 10_000) }
    beauty_type           { 'test' }
    beauty_cost           { Faker::Number.between(from: 1000, to: 10_000) }
    flower_type           { 'test' }
    flower_cost           { Faker::Number.between(from: 1000, to: 10_000) }
    print_type            { 'test' }
    print_cost            { Faker::Number.between(from: 1000, to: 10_000) }
    staging_type          { 'test' }
    staging_detail        { 'test' }
    staging_cost          { Faker::Number.between(from: 1000, to: 10_000) }
    photo_type            { 'test' }
    photo_cost            { Faker::Number.between(from: 1000, to: 10_000) }
    video_type            { 'test' }
    video_cost            { Faker::Number.between(from: 1000, to: 10_000) }
    gift_type             { 'test' }
    gift_cost             { Faker::Number.between(from: 1000, to: 10_000) }
    pre_ceremony_type    { 'test' }
    pre_ceremony_cost    { Faker::Number.between(from: 1000, to: 10_000) }
  end
end
