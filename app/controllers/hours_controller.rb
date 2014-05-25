class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /hours
  def index
    render 'shared/admin_only' unless is_admin?
    @courses = Course.last_month.sort_by(&:date)
    @series = Series.last_month.sort_by(&:end_date)
  end

  # GET /hours/1
  def show
    render 'shared/admin_only' unless is_admin?
  end

  # GET /hours/new
  def new
    @hour = Hour.new
    @courses = Course.all.sort_by(&:date)
    @tas= TeachingAssistant.all.sort_by(&:name)
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours
  def create
    hours = Course.find(params[:hour][:course_id]).credit_hours
    @hour = Hour.new(hour_params)

    if params[:student]
      @hour.num = -hours
    else
      @hour.num = hours
    end

    if @hour.save
      redirect_to root_path, notice: "Success! We have you down as a TA for #{@hour.course.name} on #{@hour.course.date}."
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
