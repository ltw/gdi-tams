class Api::CoursesController < ApplicationController
  respond_to :json

  def show
    @course = Course.find(params[:id])
    render json: @course
  end
end