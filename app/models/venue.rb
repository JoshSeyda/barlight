class Venue < ApplicationRecord
  has_one :location, as: :locatable 
end
