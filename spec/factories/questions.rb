FactoryBot.define do
  factory :question do
    statement { "What is the capital of France?" }
    association :assessment

    trait :with_answers do
      after(:create) do |question|
        create_list(:answer, 4, question: question)
      end
    end
  end
end
