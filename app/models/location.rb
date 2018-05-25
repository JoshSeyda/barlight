class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :locatable, polymorphic: true
  # has_many :users, as: :locatable 
end
