class Boat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :category, presence: true
  validates :city, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :address, presence: true
end
