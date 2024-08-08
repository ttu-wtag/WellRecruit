class Answer < ApplicationRecord
  belongs_to :question

  validates :option, presence: true
  acts_as_paranoid
end
