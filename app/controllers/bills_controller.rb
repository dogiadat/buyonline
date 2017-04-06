class BillsController < ApplicationController
  load_and_authorize_resource

  def create
    ActiveRecord::Base.transaction do
      @bill.save
      restaurant = Restaurant.find(params[:restaurant_id])
      JSON.parse(cookies[:foods]).each do |food_id, count|
        if restaurant.foods.pluck(:id).include? food_id.to_i
          food = Food.find(food_id)
          BillDetail.create bill_id: @bill.id, food_id: food_id, quantity: food.price * count, amount: count
        end
      end
      flash[:success] = "Đơn hàng đã được đặt thành công"
    end
    redirect_to restaurants_path
  end

  private
  def bill_params
    params[:bill][:bill_code] = "#{params[:restaurant_id]}#{Time.now.to_i}"
    params[:bill][:status] = :pending
    params.require(:bill).permit :restaurant_id, :total, :ship_price, :recipient_name,
      :recipient_phone, :recipient_address, :note, :status, :bill_code
  end
end
