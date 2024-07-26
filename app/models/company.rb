class Company < ApplicationRecord
  belongs_to :user

  has_one_attached :logo

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :registration_number, presence: true, uniqueness: { case_sensitive: false }
end
