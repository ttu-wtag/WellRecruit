require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:company).dependent(:destroy) }
    it { should belong_to(:office).optional.class_name('Company') }
    it { should have_many(:jobs).dependent(:destroy) }
    it { should have_many(:applications).dependent(:destroy) }
  end

  describe 'attachments' do
    it { should have_one_attached(:avatar) }
  end

  describe 'enum' do
    it { should define_enum_for(:role).with_values([:admin, :recruiter, :candidate]) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    # it 'is expected to validate that email is case-insensitively unique' do
    #   user = build(:user)
    #   user.save
    #   validate_uniqueness_of(:email).case_insensitive
    # end
    # it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(30) }
    it { should validate_presence_of(:role) }
  end

  describe 'callbacks' do
    it 'sets is_verified to true for non-recruiters' do
      user = build(:user, role: 'admin', is_verified: false)
      user.save
      expect(user.is_verified).to be true
    end

    it 'does not set is_verified to true for recruiters' do
      recruiter = build(:user, role: 'recruiter', is_verified: false)
      recruiter.save
      expect(recruiter.is_verified).to be false
    end
  end

  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'creates an admin with the admin trait' do
      admin = build(:user, :admin)
      expect(admin.role).to eq('admin')
      expect(admin.is_verified).to be true
    end

    it 'creates a recruiter with the recruiter trait' do
      recruiter = build(:user, :recruiter)
      expect(recruiter.role).to eq('recruiter')
      expect(recruiter.is_verified).to be false
    end
  end
end
