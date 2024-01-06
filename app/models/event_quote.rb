class EventQuote < ApplicationRecord
  belongs_to :event
  has_many :guests, dependent: :destroy
  has_many :ceremonies, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_many :costumes, dependent: :destroy
  has_many :beauties, dependent: :destroy
  has_many :flowers, dependent: :destroy
  has_many :prints, dependent: :destroy
  has_many :stagings, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :gifts, dependent: :destroy
  has_many :pre_ceremonies, dependent: :destroy
end
