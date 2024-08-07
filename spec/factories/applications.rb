FactoryBot.define do
  factory :application do
    association :job
    association :user
    status { :applied }

    trait :with_resume do
      after(:create) do |application|
        application.resume.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'resume.pdf')),
          filename: 'resume.pdf',
          content_type: 'application/pdf'
        )
      end
    end

    trait :with_invalid_resume do
      after(:create) do |application|
        application.resume.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'image.jpeg')),
          filename: 'image.jpeg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end
