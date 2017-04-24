class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :type, presence: true
  validates :city, presence: true
  validates :price, presence: true, numericality: { greater_than 0 }
  validates :capacity, presence: true, numericality: { greater_than 0 }
  validates :name, presence: true
  validates :address, presence: true
end
