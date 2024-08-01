class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Company
    can :read, Job

    case user.role
    when 'admin'
      #can :manage, :all
    when 'recruiter'
      if user.is_verified
        can :manage, Job, user_id: user.id
        #can :manage, Assessment, job: { user_id: user.id }
        can :manage, Assessment do |assessment|
          assessment.job.user_id == user.id
        end
        # can :read, Application, job_post: { recruiter_id: user.id }
        # can :create, MCQAssessment, job_post: { recruiter_id: user.id }
        # can :manage, MCQAssessment, job_post: { recruiter_id: user.id }
        # can :manage, Question, assessment: { job_post: { recruiter_id: user.id } }
        # can :manage, Answer, question: { assessment: { job_post: { recruiter_id: user.id } } }
        # can :manage, Participation, assessment: { job_post: { recruiter_id: user.id } }
        # can :manage, Submission, participation: { assessment: { job_post: { recruiter_id: user.id } } }
        # can :read, User, company_id: user.company_id, role: 'candidate'
      else

        # can :read, Application, job_post: { recruiter_id: user.id }
        # can :read, MCQAssessment, job_post: { recruiter_id: user.id }
        # can :read, Question, assessment: { job_post: { recruiter_id: user.id } }
        # can :read, Answer, question: { assessment: { job_post: { recruiter_id: user.id } } }
        # can :read, Participation, assessment: { job_post: { recruiter_id: user.id } }
        # can :read, Submission, participation: { assessment: { job_post: { recruiter_id: user.id } } }
      end
    when 'candidate'
      # can :read, JobPost
      # can :create, Application
      # can :manage, Application, user_id: user.id
      # can :read, MCQAssessment, candidate_selection: true
      # can :create, Participation, assessment: { candidate_selection: true }
      # can :manage, Participation, user_id: user.id
      # can :create, Submission, participation: { user_id: user.id }
      # can :manage, Submission, participation: { user_id: user.id }
      #can :read, Company
    else

    end

    # Custom logic for handling sensitive data or specific actions
    # can :view_sensitive_data, JobPost do |job_post|
    #   job_post.sensitive_data? && (user.admin? || user.recruiter?)
    # end
  end
end
