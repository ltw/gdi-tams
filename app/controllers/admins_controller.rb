class AdminsController < ApplicationController

  # GET /admins
  def index
    @admins = Admin.all
  end

  def dashboard
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
