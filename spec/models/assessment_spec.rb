require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'associations' do
    it { should belong_to(:job) }
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:participations).dependent(:destroy) }
    it { should accept_nested_attributes_for(:questions).allow_destroy(true) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:starting_time) }
    it { should validate_presence_of(:ending_time) }

    it 'should validate that ending_time is after starting_time' do
      assessment = build(:assessment, starting_time: 1.day.from_now, ending_time: 1.day.ago)
      expect(assessment).to_not be_valid
      expect(assessment.errors[:ending_time]).to include("must be after the starting time")
    end
  end
end
