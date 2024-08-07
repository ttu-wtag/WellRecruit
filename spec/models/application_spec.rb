require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'associations' do
    it { should belong_to(:job) }
    it { should belong_to(:user) }
    it { should have_one(:participation).dependent(:destroy) }
  end

  describe 'validations' do
    it { should have_one_attached(:resume) }

    context 'with resume' do
      let(:application) { build(:application, :with_resume) }

      it 'should attach a PDF resume' do
        expect(application.resume).to be_attached
        expect(application.resume.content_type).to eq('application/pdf')
      end

      it 'should be valid with a PDF resume' do
        expect(application).to be_valid
      end
    end

    context 'with invalid resume' do
      let(:application) { build(:application, :with_invalid_resume) }

      it 'should not be valid with a non-PDF resume' do
        expect(application).not_to be_valid
        expect(application.errors[:resume]).to include('must be a PDF')
      end
    end

    it 'should validate presence of resume' do
      application = build(:application, resume: nil)
      expect(application).not_to be_valid
      expect(application.errors[:resume]).to include('required')
    end

    it 'should validate the resume mime type' do
      application = build(:application, :with_invalid_resume)
      application.valid?
      expect(application.errors[:resume]).to include('must be a PDF')
    end
  end
end
