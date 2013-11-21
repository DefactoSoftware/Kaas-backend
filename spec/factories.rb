FactoryGirl.define do
  factory :category do
    name { Faker::HipsterIpsum.word }
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :device do
    user
    token { Faker::Internet.token }
  end

  factory :question do
    user
    category
    question { Faker::HipsterIpsum.sentence }
  end
end
