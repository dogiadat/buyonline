class Admin::RestaurantsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @restaurant.save
      params[:restaurant_categories].each do |category_id|
        @restaurant.restaurant_categories.create category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc thêm mới thành công"
      redirect_to admin_restaurants_path
    else
      render :new
    end
  end

  def update
    if @restaurant.save
      @restaurant.restaurant_categories.where.not(category_id: params[:restaurant_categories]).delete_all
      params[:restaurant_categories].each do |category_id|
        @restaurant.restaurant_categories.find_or_create_by category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc thêm cập nhật thành công"
      redirect_to admin_restaurants_path
    else
      render :edit
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit :name, :address, :lat, :long, :min_price,
      :max_price, :open_time, :close_time, :free_delivery_fee, :delivery_fee, :description
  end
end
