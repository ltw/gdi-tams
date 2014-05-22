module AdminsHelper
  def is_admin?
    @admin = Admin.find(session[:current_user_id])
    return true if @admin
  end
end
