class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :comments, dependent: :destroy
  has_many :favorite_restaurants, dependent: :destroy
  has_many :bills
  has_many :rates, dependent: :destroy
  has_one :restaurant, foreign_key: :manager_id

  validates :email, presence: true, length: {maximum: 128}
  validates :name, presence: true, length: {maximum: 128}
  validates :address, presence: true, length: {maximum: 128},  allow_nil: true
  validates :phone, format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/},  allow_nil: true

  scope :has_restaurant, ->{joins :restaurant}
  scope :has_no_restaurant, ->{where.not id: User.has_restaurant}

  mount_uploader :avatar, ImageUploader

  def rate restaurant
    self.rates.find_by restaurant_id: restaurant.id
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name
      user.avatar = auth.info.image
      user.skip_confirmation!
    end
  end

  def active_for_authentication?
    super and self.is_active?
  end

  def status
    is_active ? "Đang hoạt động" : "Đã bị khóa"
  end

  def is_manager?
    self.restaurant && self.restaurant.opening?
  end
end
