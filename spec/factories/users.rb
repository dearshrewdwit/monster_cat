FactoryGirl.define do
  factory :user do
    username "A test user"
    email "a@test_user.com"
    avatar_url 'cat-logo'

    trait :admin do
      admin true
    end
  end
end
