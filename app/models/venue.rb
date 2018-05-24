class Venue < ApplicationRecord
  has_one :location, as: :locatable
  has_many :images, as: :imageable
  has_many :events
  has_many :recurring_events


  def venue_marker_data
    location = self.location
    {latitude: location.latitude, longitude: location.longitude, venue: self.title}
  end 
  # def schedules
  #   Schedule.joins([{recurring_events: :venue}, {events: :venue}])
  #          .where(venues: {id: self.id})
  # end
  # SQLOutput:
  # SELECT  "schedules".* FROM "schedules" INNER JOIN "recurring_events" ON "recurring_events"."schedule_id" = "schedules"."id" INNER JOIN "venues" ON "venues"."id" = "recurring_events"."venue_id" INNER JOIN "events" ON "events"."schedule_id" = "schedules"."id" INNER JOIN "venues" "venues_events" ON "venues_events"."id" = "events"."venue_id" WHERE "venues"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 11]]

end