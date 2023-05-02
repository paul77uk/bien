FactoryBot.define do
  factory :review do
    title { "MyString" }
    body { "MyText" }
    score { 1 }
    restaurant { "MyString" }
    price { 1 }
    cuisine { "MyString" }
  end
end
