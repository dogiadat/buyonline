class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :comments, dependent: :destroy
  has_many :favorite_restaurants, dependent: :destroy
  has_many :bills
  has_many :rates, dependent: :destroy
  has_one :restaurant, foreign_key: :manager_id

  validates :email, presence: true, length: {maximum: 128}
  validates :name, presence: true, length: {maximum: 128}
  validates :address, presence: true, length: {maximum: 128}
  validates :phone, format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}

  scope :has_restaurant, ->{joins :restaurant}
  scope :has_no_restaurant, ->{where.not id: User.has_restaurant}

  mount_uploader :avatar, ImageUploader

  def rate restaurant
    self.rates.find_by restaurant_id: restaurant.id
  end
end
