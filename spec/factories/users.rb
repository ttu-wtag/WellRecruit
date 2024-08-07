FactoryBot.define do
  factory :user do
    name { "John Doe" }
    sequence(:email) { |n| "info#{n}@example.com" }
    password { "password" }
    role { :candidate }

    trait :candidate do
      role { :candidate }
      is_verified { true }
    end

    trait :admin do
      role { :admin }
      is_verified { true }
    end

    trait :recruiter do
      role { :recruiter }
      is_verified { false }
    end

    trait :with_avatar do
      after(:build) do |user|
        user.avatar.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'avatar.jpg')),
          filename: 'avatar.jpg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end
