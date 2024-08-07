FactoryBot.define do
  factory :participation do
    association :application, factory: [:application, :with_resume]
    association :assessment

    trait :with_submissions do
      after(:create) do |participation|
        create_list(:submission, 3, participation: participation)
      end
    end
  end
end
