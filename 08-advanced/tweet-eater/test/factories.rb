FactoryGirl.define do

  # Define a factory to generate a test user
  factory :user do |f|
    f.sequence(:name) { Faker::Name.name }
    f.sequence(:email) { |n| "test#{n}@test.com" }

    factory :user_with_tweets do
      after(:create) do |u|
        FactoryGirl.create_list(:tweet, Random.rand(10...500), :user => u)
      end
    end
  end

  # Define a factory to generate a test tweet
  factory :tweet do |f|
    f.sequence(:post) { Faker::Lorem.sentence }
  end
end
