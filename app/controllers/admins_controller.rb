class AdminsController < ApplicationController

  # GET /admins
  def index
    @admins = Admin.all
  end

  def dashboard
    render 'shared/admin_only' unless is_admin?
    @courses = Course.upcoming.single_day
    @series = Series.upcoming
    @tas = TeachingAssistant.all.sort_by(&:name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:name, :password)
    end
end
