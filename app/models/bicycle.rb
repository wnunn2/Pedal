class Bicycle < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
  # has_one_attached :photo
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  CATEGORIES = ["Road Bike", "Mountain Bike", "Electric Bike", "Tandem Bike", "Fixed-Gear Bike", "Folding Bike"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :day_price, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :photos, attached: true
end
