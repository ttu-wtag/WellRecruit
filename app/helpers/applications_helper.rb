module ApplicationsHelper
  def participation_score(application)
    application.participation.present? ? application.participation.score : nil
  end
end
