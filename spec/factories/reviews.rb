FactoryBot.define do
  factory :review do
    title { 'MyString' }
    body { 'Body text greater than 10' }
    score { 1 }
    restaurant { 'MyString' }
    price { 1 }
    cuisine { 'MyString' }
  end
end
