class SeriesController < ApplicationController

  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /series
  def index
    @series = Series.upcoming.includes(:courses).sort_by(&:end_date).reverse
  end

  # GET /series/1
  def show
  end

  # GET /series/new
  def new
    render 'shared/admin_only' unless is_admin?
    @series = Series.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /series/1/edit
  def edit
    render 'shared/admin_only' unless is_admin?
  end

  # POST /series
  def create
    @series = Series.new(series_params)

    if @series.save
      redirect_to admins_dashboard_path, notice: 'Series was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /series/1
  def update
    if @series.update(series_params)
      redirect_to admins_dashboard_path, notice: 'Series was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /series/1
  def destroy
    @series.destroy
    redirect_to admins_dashboard_path, notice: 'Series was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def series_params
      params.require(:series).permit(:name, :end_date)
    end
end
