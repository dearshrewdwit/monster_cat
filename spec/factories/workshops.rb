FactoryGirl.define do
  factory :workshop do
    name 'The mighty workshop'
    description 'A study in the difference between the pen and the sword'
    url 'a lovely url'
    image_url 'cat-logo'

    factory :workshop_with_feedback do
      after(:create) do |workshop|
        create(:feedback, workshop: workshop, user: create(:user))
      end
    end
  end
end
