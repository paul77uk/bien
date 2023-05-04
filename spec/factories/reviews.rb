FactoryBot.define do
  factory :review do
    title { 'Best Halal Restaurant' }
    body { Faker::Restaurant.review }
    score { Faker::Number.between(from: 0, to: 10) }
    restaurant { Faker::Restaurant.name }
    price { Faker::Number.between(from: 0, to: 10) }
    cuisine { Faker::Food.ethnic_category }
    ambiance { 'Pleasant' }
  end
end
