class TeachingAssistantsController < ApplicationController
  before_action :set_teaching_assistant, only: [:edit, :show, :update, :destroy]
  before_action :set_status, only: [:index, :show]

  # GET /teaching_assistants
  def index
    render 'shared/admin_only' unless is_admin?
    @teaching_assistants = TeachingAssistant.all.includes(:status, :hours).sort_by(&:name)
  end

  # GET /teaching_assistants/1
  def show
    render 'shared/admin_only' unless is_admin?
    courses = Course.upcoming.includes(:series).sort_by(&:date)
    @courses = courses.delete_if do |course|
      course.teaching_assistants.pluck(:private_id).include?(@teaching_assistant.private_id)
    end
    @inactive = Status.find_by_label("inactive")
    @pending = Status.find_by_label("pending")
  end

  def new
    @teaching_assistant = TeachingAssistant.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @teaching_assistant = TeachingAssistant.new(teaching_assistant_params)
    @teaching_assistant.status = Status.find_by_label("prospective")

    if is_admin? && @teaching_assistant.save
      redirect_to admins_dashboard_path, notice: "TA #{@teaching_assistant.name} successfully added and marked as prospective. Remember to process their application!"
    elsif @teaching_assistant.save
      GdiMailer.pending(@teaching_assistant).deliver!
      redirect_to thanks_teaching_assistant_path
    else
      render :new
    end
  end

  def update
    if is_admin? && @teaching_assistant.update(teaching_assistant_params)
      redirect_to admins_dashboard_path, notice: 'Teaching assistant successfully updated.'
    elsif @teaching_assistant.update(teaching_assistant_params)
      private_id = @teaching_assistant.private_id
      redirect_to sign_ups_path(private_id), notice: 'Updated!'
    else
      render :edit
    end
  end

  def thanks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teaching_assistant
      @teaching_assistant = TeachingAssistant.find_by_private_id(params[:private_id])
    end

    # Only allow a trusted parameter "white list" through.
    def teaching_assistant_params
      params.require(:teaching_assistant).permit(:name, :email, :status_id)
    end

    def set_status
      @approved = Status.find_by_label("approved")
      @banned = Status.find_by_label("banned")
      @pending = Status.find_by_label("pending")
    end
end
