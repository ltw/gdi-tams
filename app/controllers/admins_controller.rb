class AdminsController < ApplicationController
  before_action :set_resources

  def dashboard
    @title = "Organizer Dashboard"
    @course = Course.new
    render 'shared/admin_only' unless is_admin?
    @past_courses = Course.last_month.includes(:teaching_assistants, :series).sort_by(&:date).reverse
  end
end
