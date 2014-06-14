class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy, :ta_list]

  # GET /courses
  def index
    @courses = Course.upcoming.includes(:series).sort_by(&:date)
  end

  # GET /courses/1
  def show
    if @course.series_id
      @series = @course.series
      flash[:notice] = "This class is part of a series! To get the full picture of the class, you should view the series page."
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
    @series = Series.all
    render 'shared/admin_only' unless is_admin?
  end

  # GET /courses/1/edit
  def edit
    render 'shared/admin_only' unless is_admin?
    @series = Series.all
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  # CUSTOM ROUTES
  def ta_list
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :date, :url, :location, :description, :num_tas_needed, :meetup_id, :credit_hours, :series_id, :start_time, :end_time, :email_sent)
    end
end
