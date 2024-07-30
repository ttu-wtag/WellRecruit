class Submission < ApplicationRecord
  belongs_to :participation
  has_many :responses, dependent: :destroy
end
