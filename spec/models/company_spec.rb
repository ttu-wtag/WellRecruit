require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:jobs).dependent(:destroy) }
    it { should have_one_attached(:logo) }

    it 'should have many recruiters with role :recruiter' do
      user = create(:user, :recruiter)
      company = create(:company, user: user)
      create(:user, role: :recruiter, office: company)

      expect(company.recruiters.count).to eq(1)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_presence_of(:registration_number) }
    it { should validate_uniqueness_of(:registration_number) }
  end
end
