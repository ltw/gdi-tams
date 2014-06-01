class EmailsController < ApplicationController
  before_action :set_resources

  def welcome
    @ta = TeachingAssistant.find_by_id(params[:emails][:teaching_assistant])
    @ta.status = Status.find_by_label("pending")
    if @ta.save
      GdiMailer.welcome(@ta).deliver
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

  def confirmation
    @course = Course.find_by_id(params[:course_id])
    @course.email_sent = true
    if @course.save
      @tas = @course.tas
      @tas.each do |ta|
        GdiMailer.confirmation(ta, @course).deliver
      end
    end
    redirect_to admins_dashboard_path, notice: 'Email confirmation sent.'
  end
end
