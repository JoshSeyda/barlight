class Venue < ApplicationRecord
  has_one :location, as: :locatable
  has_many :images, as: :imageable
  has_many :schedules
  has_many :tenders, through: :schedules 
end
