class RatesController < ApplicationController
  load_and_authorize_resource
  def create
    if user_signed_in?
      @restaurant = Restaurant.find(params[:rate][:restaurant_id])
      if current_user.rate(@restaurant)
        current_user.rate(@restaurant).update rate_params
      else
        @rate.save
      end
    end
    respond_to do |format|
      format.js{render "rating"}
    end
  end

  def update
    @restaurant = Restaurant.find(params[:rate][:restaurant_id])
    @rate.update(rate_params) if user_signed_in?
    respond_to do |format|
      format.js{render "rating"}
    end
  end

  private
  def rate_params
    params[:rate][:user_id] = current_user.try :id
    params.require(:rate).permit :vote, :user_id, :restaurant_id
  end
end
