FactoryBot.define do
  factory :answer do
    option { "Paris" }
    correct { true }
    association :question
  end
end
