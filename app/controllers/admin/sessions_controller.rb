class Admin::SessionsController < Devise::SessionsController
  layout "application_admin"
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  private
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def after_sign_in_path_for _resource
    admin_root_path
  end

  def after_sign_out_path_for _resource
    admin_root_path
  end
end
