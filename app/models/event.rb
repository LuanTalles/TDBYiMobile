class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  has_many :comments
end
