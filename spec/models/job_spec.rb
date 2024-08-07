require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:company) }
    it { should have_one(:assessment).dependent(:destroy) }
    it { should have_many(:applications).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(6) }
    it { should validate_presence_of(:overview) }
    it { should validate_presence_of(:responsibilities) }
    it { should validate_presence_of(:requirements) }
    it { should validate_presence_of(:benifits) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:deadline) }
    it { should validate_presence_of(:salary_range) }

    it 'should not allow deadline to be in the past' do
      job = build(:job, deadline: 1.day.ago)
      expect(job).to_not be_valid
      expect(job.errors[:deadline]).to include("can't be in the past")
    end
  end
end
