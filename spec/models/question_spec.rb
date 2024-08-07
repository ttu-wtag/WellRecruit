require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:assessment) }
    it { should have_many(:answers).dependent(:destroy) }
    it { should accept_nested_attributes_for(:answers).allow_destroy(true) }
  end

  describe 'validations' do
    it { should validate_presence_of(:statement) }
  end

  context 'with answers' do
    let(:question) { create(:question, :with_answers) }

    it 'should have associated answers' do
      expect(question.answers.count).to be > 0
    end
  end
end
