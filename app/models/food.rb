class Food < ApplicationRecord
  has_many :promotion_details, dependent: :destroy
  has_many :bill_details
  belongs_to :category
  belongs_to :restaurant

  mount_uploader :url_avatar, ImageUploader

  enum status: [:sell, :sold]

  scope :filter_category, ->(category_id){where category_id: category_id}

  validates :name, :price, presence: true
end
