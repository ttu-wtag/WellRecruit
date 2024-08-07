FactoryBot.define do
  factory :assessment do
    sequence(:title) { |n| "Assessment Title #{n}" }
    starting_time { Faker::Time.forward(days: 1, period: :morning) }
    ending_time { Faker::Time.forward(days: 1, period: :evening) }

    association :job

    trait :with_questions do
      after(:create) do |assessment|
        create_list(:question, 3, assessment: assessment)
      end
    end

    trait :ending_before_starting do
      starting_time { Faker::Time.forward(days: 1, period: :morning) }
      ending_time { Faker::Time.backward(days: 1, period: :evening) }
    end
  end
end
