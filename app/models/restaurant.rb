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

  scope :hot_restaurant, ->{order order_count: :desc}
  scope :order_desc, ->{order created_at: :desc}
  scope :filter_category, ->(category_id){joins(:restaurant_categories).where restaurant_categories: {category_id: category_id}}
  scope :not_pending, ->{where.not status: "pending"}

  validates :name, :address, presence: true, length: {maximum: 128}
  validates :name, :address, :min_price, :max_price, :open_time, :close_time,
    :free_delivery_fee, :delivery_fee, presence: true
  validates :phone, format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/},  allow_nil: true
  validate :validate_form

  ransacker :avg_rate do |parent|
    Arel.sql "(SELECT AVG(vote) FROM `rates` WHERE restaurant_id=restaurants.id)"
  end

  def calc_rate
    self.rates.present? ? self.rates.sum(:vote).to_f.round(2)/self.rates.count : 0
  end

  private
  def validate_form
    if self.min_price > self.max_price
      self.errors.add :min_price, "không được lớn hơn giá lớn nhất"
    end

    if self.open_time.to_time > self.close_time.to_time
      self.errors.add :open_time, "không được lớn hơn giờ đóng cửa"
    end
  end
end
