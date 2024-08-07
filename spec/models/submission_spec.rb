require 'rails_helper'

RSpec.describe Submission, type: :model do
  # Associations
  it { should belong_to(:participation) }
  it { should have_many(:responses).dependent(:destroy) }
  it { should accept_nested_attributes_for(:responses).allow_destroy(true) }

  # Traits and nested attributes
  context 'with responses' do
    let(:submission) { create(:submission, :with_responses) }

    it 'should have responses' do
      expect(submission.responses.count).to eq(4)
    end
  end
end
