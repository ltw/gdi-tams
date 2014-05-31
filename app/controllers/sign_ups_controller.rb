class SignUpsController < ApplicationController
  # Requires a TA - looks them up by private ID
  def show
    @teaching_assistant = TeachingAssistant.find_by_private_id(params[:private_id])
    courses = Course.upcoming.includes(:series).sort_by(&:date)
    @courses = courses.delete_if do |course|
      course.teaching_assistants.pluck(:id).include?(@teaching_assistant.id)
    end
    @hour = Hour.new
    @inactive = Status.find_by_label("inactive")
    @pending = Status.find_by_label("pending")
  end
end
