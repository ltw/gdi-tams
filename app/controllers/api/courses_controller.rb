class Api::CoursesController < ApplicationController
  respond_to :json

  def index
    respond_with Course.upcoming.sort_by(&:date)
  end
end