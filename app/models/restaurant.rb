class Restaurant < ApplicationRecord
  has_many :images, as: :imageable
  has_many :favorite_restaurants, dependent: :destroy
  has_many :promotions, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :restaurant_categories, dependent: :destroy
  has_many :bills
  has_many :rates
  belongs_to :slideshow
  belongs_to :manager, class_name: "User"

  mount_uploader :url_avatar, ImageUploader

  enum status: [:opening, :closed, :pending]

  before_save :string_time_to_float

  scope :hot_restaurant, ->{order order_count: :desc}
  scope :order_desc, ->{order created_at: :desc}
  scope :filter_category, ->(category_id){joins(:restaurant_categories).where restaurant_categories: {category_id: category_id}}
  scope :not_pending, ->{where.not status: "pending"}

  # validates :name, :address, presence: true, length: {maximum: 128}
  # validates :name, :address, :min_price, :max_price, :open_time, :close_time,
  #   :free_delivery_fee, :delivery_fee, presence: true

  def calc_rate
    self.rates.present? ? self.rates.sum(:vote).to_f.round(2)/self.rates.count : 0
  end

  def string_time_to_float
    self.open_time = self.open_time.split(":")[1]/60 + self.open_time.split(":")[0]
    self.close_time = self.close_time.split(":")[1]/60 + self.close_time.split(":")[0]
  end
end
