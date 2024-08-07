FactoryBot.define do
  factory :submission do
    association :participation

    trait :with_responses do
      after(:create) do |submission|
        create_list(:response, 4, submission: submission)
      end
    end
  end
end
