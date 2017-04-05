class Manager::FoodsController < Manager::BaseController
  load_and_authorize_resource

  def index
    @foods = current_user.restaurant.foods.order(created_at: :desc)
  end

  def new
  end

  def create
    if @food.save
      flash[:success] = "Thêm mới món ăn thành công"
      redirect_to [:manager, :foods]
    else
      render :new
    end
  end

  private
  def food_params
    params[:food][:restaurant_id] =  current_user.restaurant.id
    params[:food][:status] = :sell
    params.require(:food).permit :name, :price, :status, :description, :url_avatar, :category_id, :restaurant_id, :category_id
  end
end
