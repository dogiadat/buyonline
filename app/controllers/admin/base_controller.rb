class Admin::BaseController < ActionController::Base
  layout "application_admin"
  before_action :verify_admin

  private
  def verify_admin
    redirect_to new_admin_session_path unless current_admin
  end

  def current_ability
    Ability.new current_admin, "admin"
  end
end
