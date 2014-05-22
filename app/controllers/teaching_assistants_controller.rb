class TeachingAssistantsController < ApplicationController
  before_action :set_teaching_assistant, only: [:edit, :show, :update]

  # GET /teaching_assistants
  def index
    render 'shared/admin_only' unless is_admin?
    @teaching_assistants = TeachingAssistant.all
  end

  def edit
    render 'shared/admin_only' unless is_admin?
  end

  # GET /teaching_assistants/1
  def show
    render 'shared/admin_only' unless is_admin?
  end

  def new
    @teaching_assistant = TeachingAssistant.new
  end

  def create
    @teaching_assistant = TeachingAssistant.new(teaching_assistant_params)
    @teaching_assistant.status = Status.find_by_label("prospective")

    if is_admin? && @teaching_assistant.save
      redirect_to admins_dashboard_path, notice: "TA #{@teaching_assistant.name} successfully added and marked as prospective. Remember to process their application below."
    elsif @teaching_assistant.save
      redirect_to courses_path, notice: "You will receive an email shortly with details, pending approval. Thanks for TA'ing with Girl Develop It!"
    else
      render :new
    end
  end

  def update
    if @teaching_assistant.update(teaching_assistant_params)
      redirect_to admins_dashboard_path, notice: 'Teaching assistant successfully updated.'
    else
      render :edit
    end
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
