class Bicycle < ApplicationRecord
  # has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :category, presence: true
  validates :day_price, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
