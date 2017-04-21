class Manager::RestaurantsController < Manager::BaseController
  load_and_authorize_resource

  def edit
  end

  def update
    if @restaurant.update restaurant_params
      @restaurant.restaurant_categories.where.not(category_id: params[:restaurant_categories]).delete_all
      (params[:restaurant_categories] || []).each do |category_id|
        @restaurant.restaurant_categories.find_or_create_by category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc cập nhật thành công"
      redirect_back fallback_location: manager_root_path
    else
      render :edit
    end
  end

  private
  def restaurant_params
    params[:restaurant][:manager_id] = current_user.id
    params.require(:restaurant).permit :name, :address, :lat, :long, :min_price,
      :max_price, :open_time, :close_time, :free_delivery_fee, :delivery_fee,
      :url_avatar, :description, :manager_id, :status, :phone, :email, :min_order
  end
end
