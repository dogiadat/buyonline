class Bill < ApplicationRecord
  has_many :bill_details, dependent: :destroy
  belongs_to :restaurant

  enum status: [:pending, :accepted, :rejected]
end
