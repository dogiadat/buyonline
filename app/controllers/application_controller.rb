class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?
  include ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in? && current_user.is_manager?
      flash[:warning] = "Trang bạn yêu cầu không tồn tại"
      redirect_to manager_root_path
    else
      render_404
    end
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end

  def current_ability
    Ability.new current_user
  end
end
