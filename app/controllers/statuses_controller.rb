class StatusesController < ApplicationController
  before_action :set_status, only: [:show]

  # GET /statuses
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:label)
    end
end
