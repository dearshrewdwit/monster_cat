FactoryGirl.define do
  factory :workshop do
    name 'The mighty workshop'
    url 'a lovely url'

    factory :workshop_with_feedback do
      after(:create) do |workshop|
        create(:feedback, workshop: workshop, user: create(:user))
      end
    end
  end
end
