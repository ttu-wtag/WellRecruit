class Response < ApplicationRecord
  belongs_to :submission
  acts_as_paranoid
end
