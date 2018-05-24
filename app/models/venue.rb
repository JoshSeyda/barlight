class Venue < ApplicationRecord
  has_one :location, as: :locatable
  has_many :images, as: :imageable
  has_many :events
  has_many :recurring_events

  def schedules
    Schedule.joins([{recurring_event: :venue}, {event: :venue}])
           .where(venues: {id: self.id})
  end

end