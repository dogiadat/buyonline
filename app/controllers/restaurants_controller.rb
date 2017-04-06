class RestaurantsController < ApplicationController
  load_and_authorize_resource

  def index
    @restaurants = (params[:category_id].present? ? Restaurant.filter_category(params[:category_id]) : Restaurant)
      .order_desc.page(params[:page]).per Settings.restaurants.page_size
    @categories = Category.restaurant.all
    @hot_restaurants = Restaurant.hot_restaurant.limit(Settings.restaurants.hot_restaurant_limit)
  end

  def show
    @restaurant = Restaurant.find_by id: params[:id]
  end

  def new
    @restaurant = current_user.restaurant if current_user && current_user.restaurant
  end

  def create
    if @restaurant.save
      (params[:restaurant_categories] || []).each do |category_id|
        @restaurant.restaurant_categories.create category_id: category_id
      end
      flash[:success] = "Nhà hàng đưọc thêm mới thành công"
      redirect_to @restaurant
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
      redirect_to :back
    else
      render :new
    end
  end

  def order
    @order = {name: params[:name], phone: params[:phone], address: params[:address], note: params[:note], total_delivery_fee: params[:total_delivery_fee]}
    render :order
  end

  private
  def restaurant_params
    params[:restaurant][:status] = :pending
    params[:restaurant][:manager_id] = current_user.id
    params.require(:restaurant).permit :name, :address, :lat, :long, :min_price,
      :max_price, :open_time, :close_time, :free_delivery_fee, :delivery_fee,
      :url_avatar, :description, :manager_id, :status, :phone
  end
end
