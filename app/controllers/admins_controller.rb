class AdminsController < ApplicationController

  def dashboard
    render 'shared/admin_only' unless is_admin?
    @courses = Course.upcoming.single_day.sort_by(&:date)
    @series = Series.upcoming.sort_by(&:end_date)
    @tas = TeachingAssistant.all.sort_by(&:name)
    @approved = Status.find_by_label("approved")
    @banned = Status.find_by_label("banned")
    @pending = Status.find_by_label("pending")
  end

  def emails
    render 'shared/admin_only' unless is_admin?
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
