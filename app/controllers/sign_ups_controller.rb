class SignUpsController < ApplicationController
  def show
    @teaching_assistant = TeachingAssistant.find_by_private_id(params[:private_id])
    @courses = Course.upcoming
  end
end
