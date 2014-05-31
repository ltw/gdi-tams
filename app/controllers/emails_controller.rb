class EmailsController < ApplicationController
  before_action :set_resources

  def index
    render 'shared/admin_only' unless is_admin?
  end

  def welcome
    @ta = TeachingAssistant.find_by_id(params[:emails][:teaching_assistant])
    @ta.status = Status.find_by_label("pending")
    if @ta.save
      GdiMailer.welcome(@ta).deliver!
    end
    redirect_to emails_path, notice: 'Email delivered, TA upgraded to pending.'
  end

  def monthly
    @tas = TeachingAssistant.active
    month = Date.today.strftime("%B")
    courses = Course.upcoming.includes(:series).sort_by(&:date)
    @tas.each do |ta|
      GdiMailer.monthly(ta, courses, month).deliver
    end
    redirect_to emails_path, notice: 'Monthly emails delivered. Hooray!'
  end
end
