class User < ApplicationRecord
  has_many :bicycles
  has_many :bookings
  has_many :booking_requests, through: :bicycles, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
