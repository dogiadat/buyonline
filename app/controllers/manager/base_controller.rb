class Manager::BaseController < ApplicationController
  layout "application_manager"
  before_action :verify_manager

  private
  def verify_manager
    redirect_to(root_path) unless user_signed_in? && current_user.restaurant
  end

  def current_ability
    Ability.new current_user, "manager"
  end
end
