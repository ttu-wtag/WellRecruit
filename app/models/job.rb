class Job < ApplicationRecord
  has_one :assessment, dependent: :destroy
end
