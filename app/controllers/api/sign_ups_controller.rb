class Api::SignUpsController < ApplicationController
  respond_to :json

  def show
    render json: Course.all.sort_by(&:date)
  end
end