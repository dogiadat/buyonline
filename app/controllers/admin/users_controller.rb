class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def update
    @user.update_attributes is_active: !@user.is_active
    respond_to do |format|
      format.json {
        render json: {
          success: true,
          is_active: @user.is_active,
          id: @user.id
        }
      }
    end
  end
end
