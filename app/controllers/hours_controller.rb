class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /hours
  def index
    render 'shared/admin_only' unless is_admin?
    @courses = Course.last_month.includes(:teaching_assistants, :series).sort_by(&:date).reverse
  end

  # GET /hours/1
  def show
    render 'shared/admin_only' unless is_admin?
  end

  # GET /hours/new
  def new
    render 'shared/admin_only' unless is_admin?
    @hour = Hour.new
    @courses = Course.all.sort_by(&:date).collect {|c| ["#{c.pretty_date} - #{c.name}", c.id]}
    @tas = TeachingAssistant.all.sort_by(&:name).collect {|ta| [ta.name, ta.id]}
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours
  def create
    hours = Course.find(params[:hour][:course_id]).credit_hours
    @hour = Hour.new(hour_params)
    private_id = @hour.teaching_assistant.private_id

    if params[:student]
      @hour.num = -hours
    elsif !@hour.teaching_assistant.approved?
      @hour.num = 0
    else
      @hour.num = hours
    end

    render :new unless @hour.save

    if is_admin?
      redirect_to admins_dashboard_path, notice: 'Hour was successfully created.'
    else
      redirect_to sign_ups_path(private_id), notice: 'Got it! See you in class.'
    end
  end

  # PATCH/PUT /hours/1
  def update
    if is_admin? && @hour.update(hour_params)
      redirect_to hours_path, notice: 'Hour was successfully updated.'
    elsif @hour.update(hour_params)
      private_id = @hour.teaching_assistant.private_id
      redirect_to sign_ups_path(private_id), notice: 'RSVP was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hours/1
  def destroy
    name = @hour.course.name
    date = @hour.course.date
    @hour.destroy

    if is_admin?
      redirect_to admins_dashboard_path, notice: 'Hour was successfully removed.'
    else
      private_id = @hour.teaching_assistant.private_id
      redirect_to sign_ups_path(private_id), notice: "RSVP cancelled for #{name} on #{date}."
    end
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
