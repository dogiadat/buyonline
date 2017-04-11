class Bill < ApplicationRecord
  has_many :bill_details, dependent: :destroy
  belongs_to :restaurant
  belongs_to :user

  enum status: [:pending, :accepted, :rejected]

  # def total_price
  #   self.bill_details.sum(:quantity) + ship_price
  # end
end
