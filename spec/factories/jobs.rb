FactoryBot.define do
  factory :job do
    sequence(:title) { |n| "Job Title #{n}" }
    overview { "This is a brief overview of the job." }
    responsibilities { "List of responsibilities for the job." }
    requirements { "List of requirements for the job." }
    benifits { "List of benefits for the job." }
    location { "Location of the job" }
    deadline { Faker::Date.forward(days: 30) }
    salary_range { "50000 - 60000" }

    association :user
    association :company

    trait :past_deadline do
      deadline { Faker::Date.backward(days: 30) }
    end
  end
end
