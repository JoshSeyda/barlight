class Venue < ApplicationRecord
  has_one :location, as: :locatable
  has_many :images, as: :imageable
  has_many :events
  has_many :recurring_events


  def venue_marker_data
    location = self.location
    {latitude: location.latitude, longitude: location.longitude, venue: self.title}
  end 

  def employees
    all_events = []       
    Event.where(venue_id: self.id).each {|e| all_events.push(e) }
    RecurringEvent.where(venue_id: self.id).each {|e| all_events.push(e) }
    industry_workers = all_events.map { |event| event.server_schedule.user }.uniq
  end

end