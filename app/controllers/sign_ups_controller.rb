class SignUpsController < ApplicationController
  # Requires a TA - looks them up by private ID
  def show
    @teaching_assistant = TeachingAssistant.find_by_private_id(params[:private_id])
    @courses = Course.upcoming.single_day
    @series = Series.upcoming
    @hour = Hour.new
  end
end
