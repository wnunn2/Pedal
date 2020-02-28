class Bicycle < ApplicationRecord
  CATEGORIES = ["Road Bike", "Mountain Bike", "Electric Bike", "Tandem Bike", "Fixed-Gear Bike", "Folding Bike"]
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  # has_one_attached :photo
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :day_price, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :photos, attached: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
end
