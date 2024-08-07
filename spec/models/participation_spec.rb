require 'rails_helper'

RSpec.describe Participation, type: :model do
  # Associations
  it { should belong_to(:application) }
  it { should belong_to(:assessment) }
  it { should have_many(:submissions).dependent(:destroy) }
  it { should accept_nested_attributes_for(:submissions).allow_destroy(true) }

  # Traits and nested attributes
  context 'with submissions' do
    let(:participation) { create(:participation, :with_submissions) }

    it 'should have submissions' do
      expect(participation.submissions.count).to eq(3)
    end
  end
end
