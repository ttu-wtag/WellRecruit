class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Company
    can :read, Job

    case user.role
    when 'admin'
      can :manage, Company, user_id: user.id
    when 'recruiter'
      if user.is_verified
        can :manage, Job, user_id: user.id
        can :manage, Assessment, job: { user_id: user.id }
        can :manage, Question, assessment: { job: { user_id: user.id } }
        can :index, Application, job: { user_id: user.id }
        can :change_status, Application, job: { user_id: user.id }
      end
    when 'candidate'
      can [:candidate_applications, :show, :create, :update, :destroy], Application, user_id: user.id
      can [:new, :create], Participation, Application: { user_id: user.id }
    end
  end
end
