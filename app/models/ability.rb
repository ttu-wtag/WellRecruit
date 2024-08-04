class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Company
    can :read, Job

    case user.role
    when 'admin'
      can :manage, Company, user_id: user.id
      # can :manage, Recruiter
    when 'recruiter'
      if user.is_verified
        can :manage, Job, user_id: user.id
        can :manage, Assessment, job: { user_id: user.id }
        can :manage, Question, assessment: { job: { user_id: user.id } }
        can :read, Application, job: { user_id: user.id }
        can :change_status, Application, job: { user_id: user.id }
        # cannot :manage, Application
      end
    when 'candidate'
      cannot :change_status, Application
      can :manage, Application, user_id: user.id
      can [:new, :create], Participation, Application: { user_id: user.id }
    end
  end
end
