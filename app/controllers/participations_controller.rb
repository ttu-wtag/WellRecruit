class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[ show edit update destroy ]
  before_action :set_application, only: %i[ new create ]
  before_action :set_questions, only: %i[ new create ]

  # GET /participations or /participations.json
  def index
    @participations = Participation.all
  end

  # GET /participations/1 or /participations/1.json
  def show
  end

  # GET /participations/new
  def new
    @participation = @application.build_participation
    @questions.each do |question|
      submission = @participation.submissions.build(question_id: question.id)
      question.answers.each do |answer|
        submission.responses.build(answer_id: answer.id)
      end
    end
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations or /participations.json
  def create
    @participation = @application.build_participation(participation_params)

    respond_to do |format|
      if @participation.save
        format.html { redirect_to application_url(@participation.application), notice: "Participation was successfully created." }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1 or /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to participation_url(@participation), notice: "Participation was successfully updated." }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1 or /participations/1.json
  def destroy
    @participation.destroy!

    respond_to do |format|
      format.html { redirect_to participations_url, notice: "Participation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

  def set_application
    @application = Application.find(params[:application_id])
  end

  def set_questions
    @assessment = @application.job.assessment
    @questions = @assessment.questions.includes(:answers)
  end

    # Only allow a list of trusted parameters through.
    # def participation_params
    #   params.require(:participation).permit(:score, :application_id, :assessment_id)
    # end

    def participation_params
      params.require(:participation).permit(
        :application_id, :assessment_id,
        submissions_attributes: [
          :id, :question_id, :_destroy,
          responses_attributes: [:id, :answer_id, :correct, :_destroy]
        ]
      )
    end
end
