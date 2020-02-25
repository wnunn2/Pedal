class Bicycle < ApplicationRecord
  # has_one_attached :photo
  belongs_to :user
  has_many :bookings
  CATEGORIES = ["sports", "mountain", "electric", "tandem", "French", "unicycle", "fixed-gear"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :day_price, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
