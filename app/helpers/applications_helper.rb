module ApplicationsHelper

  def participation(application)
    application.participation
  end

  def participation_score(application)
    application.participation.present? ? application.participation.score : "Not Participated"
  end

  def assessment(application)
    application.selected? and application.job.assessment.present? ? application.job.assessment : nil
  end

  def schedule(application)
    assessment = assessment(application)
    utc_time = Time.parse(assessment.starting_time.to_s).utc
    time_zone = 'Asia/Dhaka'

    local_time = utc_time.in_time_zone(time_zone)
    local_time.strftime("%A, %B %d, %Y %I:%M %p %Z")
  end

  def duration(application)
    assessment = assessment(application)
    (Time.parse(assessment.ending_time.to_s) - Time.parse(assessment.starting_time.to_s)) / 60
  end
end
