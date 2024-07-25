class Assessment < ApplicationRecord
  belongs_to :job
  has_many :assessment, dependent: :destroy
end
