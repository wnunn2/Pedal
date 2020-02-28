class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion:  { in: ["pending", "accepted", "rejected"] }


  def total_price
    (end_date - start_date).to_i * bicycle.day_price
  end

  def show
   total_price
  end


end

