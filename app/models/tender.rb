class Tender < User
  has_many :schedules
  has_one :location, as: :locatable 
end
