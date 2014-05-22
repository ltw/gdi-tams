class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:name, :password_digest)
    end
end
