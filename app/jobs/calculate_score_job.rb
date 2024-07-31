class CalculateScoreJob < ApplicationJob
  queue_as :default

  def perform(participation_id)
    participation = Participation.find(participation_id)
    submissions = participation.submissions.includes(:responses)
    participation.score = 0

    submissions.each do |submission|
      correct = true
      submission.responses.each do |response|
        if response.correct != Answer.find_by_id(response.answer_id).correct
          correct = false
          break
        end
      end

      correct ? participation.score += 1 : participation.score += 0
    end

    participation.update(score: participation.score)
  end
end
