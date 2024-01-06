class EventQuote < ApplicationRecord
  belongs_to :event
  has_many :guests
  has_many :ceremonies
  has_many :foods
  has_many :venues
  has_many :costumes
  has_many :beauties
  has_many :flowers
  has_many :prints
  has_many :stagings
  has_many :photos
  has_many :videos
  has_many :gifts
  has_many :pre_ceremonies
end
