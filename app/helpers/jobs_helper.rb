module JobsHelper
  def has_applied(job)
    application = job.applications.find_by(user_id: current_user.id)
  end
end
