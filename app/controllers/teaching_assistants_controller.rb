class TeachingAssistantsController < ApplicationController
  before_action :set_teaching_assistant, only: [:show, :edit, :update, :destroy]

  # GET /teaching_assistants
  def index
    @teaching_assistants = TeachingAssistant.all
  end

  # GET /teaching_assistants/1
  def show
  end

  # GET /teaching_assistants/new
  def new
    @teaching_assistant = TeachingAssistant.new
  end

  # GET /teaching_assistants/1/edit
  def edit
  end

  # POST /teaching_assistants
  def create
    @teaching_assistant = TeachingAssistant.new(teaching_assistant_params)

    if @teaching_assistant.save
      redirect_to @teaching_assistant, notice: 'Teaching assistant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teaching_assistants/1
  def update
    if @teaching_assistant.update(teaching_assistant_params)
      redirect_to @teaching_assistant, notice: 'Teaching assistant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teaching_assistants/1
  def destroy
    @teaching_assistant.destroy
    redirect_to teaching_assistants_url, notice: 'Teaching assistant was successfully destroyed.'
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
