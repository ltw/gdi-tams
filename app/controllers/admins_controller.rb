class AdminsController < ApplicationController

  def dashboard
    render 'shared/admin_only' unless is_admin?
    @courses = Course.upcoming.includes(:series, :teaching_assistants).sort_by(&:date)
    @approved = Status.find_by_label("approved")
    @banned = Status.find_by_label("banned")
    @pending = Status.find_by_label("pending")
  end

  def emails
    render 'shared/admin_only' unless is_admin?
  end
end
