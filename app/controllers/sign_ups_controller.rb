class SignUpsController < ApplicationController
  # Requires a TA - looks them up by private ID
  def show
    @teaching_assistant = TeachingAssistant.find_by_private_id(params[:private_id])
    @courses = Course.upcoming.single_day.sort_by(&:date)
    @series = Series.upcoming
    @hour = Hour.new
    @inactive = Status.find_by_label("inactive")
    @pending = Status.find_by_label("pending")
  end
end
