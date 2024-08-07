FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
    sequence(:email) { |n| "info#{n}@example.com" }
    sequence(:registration_number) { |n| "REG#{n}" }

    association :user  # Assuming Company belongs to a User

    trait :with_logo do
      after(:build) do |company|
        company.logo.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'logo.png')),
          filename: 'logo.png',
          content_type: 'image/png'
        )
      end
    end
  end
end
