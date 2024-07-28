class Question < ApplicationRecord
  belongs_to :assessment
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :statement, presence: true
  validate :must_have_exactly_four_answers

  private

  def must_have_exactly_four_answers
    if answers.size != 4
      errors.add(:base, 'must have exactly four options')
    end
  end
end
