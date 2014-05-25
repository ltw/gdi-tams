class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /hours
  def index
    @courses = Course.last_month.sort_by(&:date)
  end

  # GET /hours/1
  def show
  end

  # GET /hours/new
  def new
    @hour = Hour.new
    @course = Course.find(params[:course_id])
    @teaching_assistant = TeachingAssistant.find(params[:teaching_assistant_id])
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours
  def create
    @hour = Hour.new(hour_params)
    private_id = TeachingAssistant.find(hour_params[:teaching_assistant_id]).private_id

    if @hour.save
      redirect_to sign_ups_path(private_id), notice: "Success! We have you down as a TA for #{@hour.course.name} on #{@hour.course.date}."
    else
      render :new
    end
  end

  # PATCH/PUT /hours/1
  def update
    if @hour.update(hour_params)
      redirect_to @hour, notice: 'Hour was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hours/1
  def destroy
    private_id = @hour.teaching_assistant.private_id
    name = @hour.course.name
    date = @hour.course.date
    @hour.destroy
    redirect_to sign_ups_path(private_id), notice: "You are no longer TA'ing for #{name} on #{date}."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hour_params
      params.require(:hour).permit(:course_id, :teaching_assistant_id, :num)
    end
end
