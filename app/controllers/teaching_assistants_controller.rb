class TeachingAssistantsController < ApplicationController
  before_action :set_teaching_assistant, only: [:show]

  # GET /teaching_assistants
  def index
    @teaching_assistants = TeachingAssistant.all
  end

  # GET /teaching_assistants/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teaching_assistant
      @teaching_assistant = TeachingAssistant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teaching_assistant_params
      params.require(:teaching_assistant).permit(:name, :email, :status_id)
    end
end
