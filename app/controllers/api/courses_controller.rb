class Api::CoursesController < ApplicationController
  respond_to :json

  def index
    render json: Course.upcoming.sort_by(&:date)
  end
end