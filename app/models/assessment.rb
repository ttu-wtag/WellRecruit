class Assessment < ApplicationRecord
  belongs_to :job
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
end
