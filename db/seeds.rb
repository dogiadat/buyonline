Admin.create email: "admin@gmail.com", password: 123456, password_confirmation: 123456

10.times do |i|
  Category.create name: "category-food #{i+1}", category_type: :food
end

10.times do |i|
  Category.create name: "category-restaurant #{i+1}", category_type: :restaurant
end

# 10.times do |i|
#   category = Category.create name: "category #{i+1}", category_type: :restaurant
#   9.times do |j|
#     restaurant = Restaurant.create name: "restaurant #{i}#{j+1}",
#       address: Faker::Address.street_address,
#       phone: Faker::PhoneNumber.cell_phone,
#       open_time: "07:00",
#       close_time: "20:00",
#       url_avatar: Faker::Avatar.image,
#       status: ["pending", "opening"].sample,
#       order_count: "#{i*10 + j}",
#       description: Faker::Hipster.paragraph(3, true),
#       min_order: 50000,
#       min_price: 20000,
#       max_price: 100000,
#       delivery_fee: 5000
#     10.times do |f|
#       Food.create name: "Food #{i} #{f+1}",
#         price: 20000,
#         restaurant_id: restaurant.id,
#         status: "sell",
#         url_avatar: Faker::Avatar.image,
#         category_id: Category.food.sample.id
#     end
#   end
# end

User.create email: "nguyenmyhuyen@gmail.com",
  password: 123456,
  password_confirmation: 123456,
  phone: "0123456789",
  address: "Ha noi",
  name: "Nguyễn Mỹ Huyền",
  confirmed_at: Time.now

dat = User.create email: "dogiadat@gmail.com",
  password: 123456,
  password_confirmation: 123456,
  phone: "0123456789",
  address: "Ha noi",
  name: "Đỗ Gia Đạt",
  confirmed_at: Time.now

User.create email: "dohongson@gmail.com",
  password: 123456,
  password_confirmation: 123456,
  phone: "0123456789",
  address: "Ha noi",
  name: "Đỗ Hồng Sơn",
  confirmed_at: Time.now

# restaurant = Restaurant.create name: "My restaurant", manager_id: dat.id, address: "Keangnam, Hà Nội, Việt Nam", lat: 21.0170303, long: 105.7839017,
#   phone: "0987964276", email: "dogiadat@gmail.com", min_price: 30000, max_price: 300000,
#   delivery_fee: 5000, open_time: "07:30", close_time: "20:30", status: :opening,
#   url_avatar: File.open(File.join(Rails.root, "app/assets/images/images/15.jpg"))
# RestaurantCategory.create restaurant_id: restaurant.id, category_id: Category.first.id
# RestaurantCategory.create restaurant_id: restaurant.id, category_id: Category.last.id
# restaurant.foods.create price: 25000, name: "Món ăn 1", url_avatar: File.open(File.join(Rails.root, "app/assets/images/images/20.jpg")), category_id: Category.first.id
# restaurant.foods.create price: 30000, name: "Món ăn 2", url_avatar: File.open(File.join(Rails.root, "app/assets/images/images/22.jpg")), category_id: Category.last.id

20.times do |i|
  user = User.create email: "email#{i+1}@gmail.com", password: 123456, phone: "0123456789", address: "Hà Nội", name: "User#{i+1}", confirmed_at: Time.now
end

#1
restaurant1 = Restaurant.create name: "Kimsabao - Bánh Bao Kim Sa Hồng Kông - Shop Online", address: "Ngõ 55, Hoàng Hoa Thám, Hà Nội, quận Ba Đình, Việt Nam", lat: 21.038613709124512,
  long: 105.82643513121343, phone: "0123456789", open_time: "07:30", close_time: "21:00", status: "opening",
  description: "Quán mát mẻ thích hợp tránh nắng.
    Trưa ở nhà nóng bức quá nên chạy qua đây trốn nắng. Quán có thiết kế đơn giản nhưng nhìn vẫn thu hút. Không gian thoáng mát, nhân viên dễ thương và lịch sự.
    Nước uống thì nhìn hấp dẫn đẹp mắt. Bánh ngon.",
  min_price: 15000, max_price: 50000, delivery_fee: 5000, email: "dogiadat95@gmail.com", free_delivery_fee: 150000, manager_id: 1, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/1.jpg"))

2.times do
  RestaurantCategory.create restaurant_id: 1, category_id: Category.restaurant.sample.id
end
Food.create restaurant_id: 1, name: "Bánh Bao Matcha Trứng muối", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/1_1.jpg")), price: 60000, category_id: 1
Food.create restaurant_id: 1, name: "Chân Gà Sốt Tàu Xì", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/1_2.jpg")), price: 60000, category_id: 1
Food.create restaurant_id: 1, name: "Kimsabao", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/1_3.jpg")), price: 60000, category_id: 2
Food.create restaurant_id: 1, name: "Xá Xíu Nướng", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/1_4.jpg")), price: 60000, category_id: 2
Food.create restaurant_id: 1, name: "Chân gà sốt cay Tứ Xuyên", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/1_5.jpg")), price: 60000, category_id: 2

#2
restaurant2 = Restaurant.create name: "Soya Garden - Ô Chợ Dừa", address: "150b Ô Chợ Dừa, Hà Nội, quận Đống Đa, Việt Nam", lat: 21.020007,
  long: 105.8268405, phone: "0123456789", open_time: "09:00", close_time: "21:00", status: "opening",
  description: "",
  min_price: 31000, max_price: 69000, delivery_fee: 5000, email: "dogiadat95@gmail.com", manager_id: 2, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/2.jpg"))
2.times do
  RestaurantCategory.create restaurant_id: 2, category_id: Category.restaurant.sample.id
end
Food.create restaurant_id: 2, name: "Shizouka Matcha", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/2_1.jpg")), price: 31000, category_id: 1
Food.create restaurant_id: 2, name: "Tokyo Taro", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/2_2.jpg")), price: 39000, category_id: 1
Food.create restaurant_id: 2, name: "Meiji Chokoreto", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/2_3.jpg")), price: 39000, category_id: 1
Food.create restaurant_id: 2, name: "Good Day Hokkaido", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/2_4.jpg")), price: 39000, category_id: 2
Food.create restaurant_id: 2, name: "Osaka Vanilla", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/2_5.jpg")), price: 39000, category_id: 2

#3
restaurant3 = Restaurant.create name: "Yummi Yummi - Dimsum & Bánh Bao Bán Online", address: "1 Ngách 221 Thịnh Quang, Quận Đống Đa, Hà Nội", lat: 21.0077423,
  long: 105.81740339999999, phone: "0123456789", open_time: "09:00", close_time: "21:00", status: "opening",
  description: "",
  min_price: 50000, max_price: 500000, delivery_fee: 5000, email: "dogiadat95@gmail.com", manager_id: 3, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/3.jpg"))
2.times do
  RestaurantCategory.create restaurant_id: 3, category_id: Category.restaurant.sample.id
end
Food.create restaurant_id: 3, name: "Bánh bao trứng sữa", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/3_1.jpg")), price: 31000, category_id: 1
Food.create restaurant_id: 3, name: "Chân gà tàu xì (túi nhỏ 6 cái)", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/3_2.jpg")), price: 39000, category_id: 1
Food.create restaurant_id: 3, name: "Bánh bao Trà xanh", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/3_3.jpg")), price: 39000, category_id: 1
Food.create restaurant_id: 3, name: "Bánh bao Xá xíu", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/3_4.jpg")), price: 39000, category_id: 2
Food.create restaurant_id: 3, name: "Bánh bao Kim sa", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/3_5.jpg")), price: 39000, category_id: 2

#4
restaurant4 = Restaurant.create name: "Bún Miến Ngan - Cầu Giấy", address: "1 Ngách 221 Thịnh Quang, Quận Đống Đa, Hà Nội", lat: 21.031391,
  long: 105.79989599999999, phone: "0123456789", open_time: "09:00", close_time: "20:00", status: "opening",
  description: "",
  min_price: 30000, max_price: 40000, delivery_fee: 5000, email: "dogiadat95@gmail.com", manager_id: 4, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/4.jpg"))
2.times do
  RestaurantCategory.create restaurant_id: 4, category_id: Category.restaurant.sample.id
end
Food.create restaurant_id: 4, name: "Bún ngan trộn", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/4_1.jpg")), price: 30000, category_id: 1
Food.create restaurant_id: 4, name: "Bún ngan nước", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/4_2.jpg")), price: 35000, category_id: 1
Food.create restaurant_id: 4, name: "Miến ngan trộn", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/4_3.jpg")), price: 30000, category_id: 1
Food.create restaurant_id: 4, name: "Miến ngan nước", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/4_4.jpg")), price: 35000, category_id: 2
Food.create restaurant_id: 4, name: "Canh măng lòng mề", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/4_5.jpg")), price: 35000, category_id: 2

#5
restaurant5 = Restaurant.create name: "Ding Tea - Huỳnh Thúc Kháng", address: "47 Huỳnh Thúc Kháng, Hà Nội, quận Đống Đa, Việt Nam", lat: 21.01869589999999,
  long: 105.81030899999996, phone: "0123456789", open_time: "09:00", close_time: "21:00", status: "opening",
  description: "",
  min_price: 25000, max_price: 45000, delivery_fee: 5000, email: "dogiadat95@gmail.com", manager_id: 5, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/5.jpg"))
2.times do
  RestaurantCategory.create restaurant_id: 5, category_id: Category.restaurant.sample.id
end
Food.create restaurant_id: 5, name: "Hồng trà sữa", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_1.jpg")), price: 30000, category_id: 1
Food.create restaurant_id: 5, name: "Trà sữa khoai môn", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_2.jpg")), price: 35000, category_id: 1
Food.create restaurant_id: 5, name: "Trà xanh Nhật Bản", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_3.jpg")), price: 30000, category_id: 1
Food.create restaurant_id: 5, name: "Trà sữa socola", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_4.jpg")), price: 35000, category_id: 2
Food.create restaurant_id: 5, name: "Trà sữa trân châu", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_5.jpg")), price: 35000, category_id: 2

10.times do |i|
  #5
  restaurant5 = Restaurant.create name: "Ding Tea - Huỳnh Thúc Kháng #{i+1}", address: "47 Huỳnh Thúc Kháng, Hà Nội, quận Đống Đa, Việt Nam", lat: 21.01869589999999,
    long: 105.81030899999996, phone: "0123456789", open_time: "09:00", close_time: "21:00", status: "opening",
    description: "",
    min_price: 25000, max_price: 45000, delivery_fee: 5000, email: "dogiadat95@gmail.com", manager_id: 5 + i + 1, url_avatar: File.open(File.join(Rails.root, "app/assets/images/restaurants/5.jpg"))
  2.times do
    RestaurantCategory.create restaurant_id: restaurant5.id, category_id: Category.restaurant.sample.id
  end
  Food.create restaurant_id: restaurant5.id, name: "Hồng trà sữa", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_1.jpg")), price: 30000, category_id: 1
  Food.create restaurant_id: restaurant5.id, name: "Trà sữa khoai môn", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_2.jpg")), price: 35000, category_id: 1
  Food.create restaurant_id: restaurant5.id, name: "Trà xanh Nhật Bản", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_3.jpg")), price: 30000, category_id: 1
  Food.create restaurant_id: restaurant5.id, name: "Trà sữa socola", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_4.jpg")), price: 35000, category_id: 2
  Food.create restaurant_id: restaurant5.id, name: "Trà sữa trân châu", url_avatar: File.open(File.join(Rails.root, "app/assets/images/foods/5_5.jpg")), price: 35000, category_id: 2
end
