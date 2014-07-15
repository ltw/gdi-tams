class AdminsController < ApplicationController
  before_action :set_resources

  def dashboard
    @title = "Organizer Dashboard"
    render 'shared/admin_only' unless is_admin?
    @course = Course.new
    @past_courses = Course.last_month.includes(:teaching_assistants, :series).sort_by(&:date).reverse
    @monthly_email = EmailHistory.most_recent
  end
end
