class HoursController < ApplicationController
  include HoursHelper

  before_action :set_hour, only: [:show, :edit, :update, :destroy]

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
    @hour = Hour.new(hour_params)
    private_id = @hour.teaching_assistant.private_id

    build_hour_from(@hour)

    if is_admin?
      redirect_to admins_dashboard_path, notice: 'Hour was successfully created.'
    else
      redirect_to teaching_assistant_path(private_id), notice: 'Got it! See you in class.'
    end
  end

  def mass_create
    series = Series.find(params[:hour][:series_id])
    ta = TeachingAssistant.find(params[:hour][:teaching_assistant_id])
    private_id = ta.private_id

    build_series_hours(series, ta)

    if is_admin?
      redirect_to admins_dashboard_path, notice: 'Hour was successfully created.'
    else
      redirect_to teaching_assistant_path(private_id), notice: 'Got it! See you in class.'
    end
  end

  # PATCH/PUT /hours/1
  def update
    if is_admin? && @hour.update(hour_params)
      redirect_to admins_dashboard_path, notice: 'Hour was successfully updated.'
    elsif @hour.update(hour_params)
      private_id = @hour.teaching_assistant.private_id
      redirect_to teaching_assistant_path(private_id), notice: 'RSVP was successfully updated.'
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
      redirect_to teaching_assistant_path(private_id), notice: "RSVP cancelled for #{name} on #{date}."
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
