class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user

  has_one :participation, dependent: :destroy

  has_one_attached :resume

  validate :correct_resume_mime_type

  enum status: [:applied, :selected, :rejected, :passed]

  private

  def correct_resume_mime_type
    if resume.attached? && !resume.content_type.in?(%w(application/pdf))
      errors.add(:resume, 'must be a PDF')
    elsif resume.attached? == false
      errors.add(:resume, 'required')
    end
  end
end
