class NewRestaurantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_restaurant_mailer.new_restaurant.subject
  #
  def new_restaurant restaurant
    @restaurant = restaurant
    mail to: @restaurant.email, subject: "Nhà hàng tạo thành công"
    mail to: @restaurant.manager.email, subject: "Nhà hàng tạo thành công"
  end
end
