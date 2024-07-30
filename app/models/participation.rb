class Participation < ApplicationRecord
  belongs_to :application
  belongs_to :assessment
  has_many :submissions, dependent: :destroy
end
