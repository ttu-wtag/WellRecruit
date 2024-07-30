class ParticipationController < ApplicationController
  def new
    @application = Application.find(params[:application_id])
    @assessment = @application.job.assessment
    @questions = @assessment.questions.includes(:answers)
    @participation = @application.build_participation
    @questions.count.times do
      @submission = @participation.submissions.build
      4.times { @submission.responses.build }
    end
  end

  def create

  end
end
