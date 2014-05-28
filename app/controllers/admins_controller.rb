class AdminsController < ApplicationController
  before_action :set_resources

  def dashboard
    render 'shared/admin_only' unless is_admin?
  end

  def emails
    render 'shared/admin_only' unless is_admin?
  end

  private
  def set_resources
    @series = Series.upcoming.sort_by(&:end_date)
    @tas = TeachingAssistant.all.sort_by(&:name)
    @approved = Status.find_by_label("approved")
    @pending = Status.find_by_label("pending")
    @prospective = Status.find_by_label("prospective")
    @banned = Status.find_by_label("banned")
    @inactive = Status.find_by_label("inactive")
  end
end
