FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
