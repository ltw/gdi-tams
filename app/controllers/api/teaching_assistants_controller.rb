class Api::TeachingAssistantsController < ApplicationController
  respond_to :json

  def show
    ta = TeachingAssistant.find_by_private_id(params[:id])
    render json: ta
  end
end