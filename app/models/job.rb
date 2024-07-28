class Job < ApplicationRecord
  belongs_to :user
  has_one :assessment, dependent: :destroy
end
