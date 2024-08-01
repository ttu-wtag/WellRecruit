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
        can :manage, Assessment, job: { user_id: user.id }
        can :manage, Question, assessment: { job: { user_id: user.id } }
        can :index, Application, job: { user_id: user.id }
        can :change_status, Application, job: { user_id: user.id }
      end
    when 'candidate'
      cannot :change_status, Application
      can :manage, Application, user_id: user.id
      can [:new, :create], Participation, Application: { user_id: user.id }
    end

    # Custom logic for handling sensitive data or specific actions
    # can :view_sensitive_data, JobPost do |job_post|
    #   job_post.sensitive_data? && (user.admin? || user.recruiter?)
    # end
  end
end
