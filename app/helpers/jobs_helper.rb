module JobsHelper
  def has_applied(job)
    if current_user.applications.include?(job)
      current_user.applications.find(job)
    else
      false
    end
  end
end
