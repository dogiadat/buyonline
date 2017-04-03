class Admin::RestaurantsController < Admin::BaseController
  load_and_authorize_resource
  before_action :restaurant_for_select, except: [:index, :destroy]

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @restaurant.save
      (params[:restaurant_categories] || []).each do |category_id|
        @restaurant.restaurant_categories.create category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc thêm mới thành công"
      redirect_to admin_restaurants_path
    else
      render :new
    end
  end

  def update
    if @restaurant.update restaurant_params
      @restaurant.restaurant_categories.where.not(category_id: params[:restaurant_categories]).delete_all
      (params[:restaurant_categories] || []).each do |category_id|
        @restaurant.restaurant_categories.find_or_create_by category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc thêm cập nhật thành công"
      redirect_to admin_restaurants_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def restaurant_params
    params[:restaurant][:status] = :opening
    params.require(:restaurant).permit :name, :address, :lat, :long, :min_price,
      :max_price, :open_time, :close_time, :free_delivery_fee, :delivery_fee,
      :url_avatar, :description, :manager_id, :status, :phone
  end

  def restaurant_for_select
    @restaurant_for_select = User.has_no_restaurant.pluck(:name, :id)
    @restaurant_for_select << [@restaurant.manager.name, @restaurant.manager.id] unless @restaurant.new_record?
  end
end
