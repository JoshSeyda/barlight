class Schedule < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :recurring_events 

  def shifts
    # Schedule.includes(:events, :recurring_events)
    #        .where(schedules: {id: self.id})
    # events = Event.joins(venue: [:location]).where(schedules: {id: self.id})
    # recurring_events = RecurringEvent.includes(venue: [:location]).joins(schedules: {id: self.id})
    events = []
    recurring_events = []
    self.events.each{ |event| events.push(event) if event.in_progress? }
    self.recurring_events.each{ |recurring_event| recurring_events.push(recurring_event) if recurring_event.schedule.occurs_at?(Time.now) } 
    events + recurring_events
  end

  def venues
    shifts = self.shifts
    array_of_venue_info = []
    if shifts 
      shifts.map do |event|
        location_hash = event.venue.venue_marker_data
        location_hash[:tender] = event.server_schedule.user.handle
        location_hash[:light_on] = event.light_on
        array_of_venue_info.push(location_hash)
      end
      return array_of_venue_info
    end
  end

end
# Event.joins(:schedule).where(schedule_id: self.id)

#   def locations
#     self.left_joins(:events).left_joins
#   end 
# Reading.includes(region: { stores: :manager }).where(
#   manager: { name: 'John Smith' },
#   region: { id: 1234567 })

  # Author.left_joins :posts, :comments
  # Author Load (0.1ms)  SELECT "authors".* FROM "authors" LEFT OUTER JOIN "posts" ON "posts"."author_id" = "authors"."id" LEFT OUTER JOIN "comments" ON "comments"."author_id" = "authors"."id"
  # def locations
  #   Venue.joins(:location).pluck(:latitude, :longitude, :id, :title)
  #   self.venues.map {|v| v.location }
  #   locations = self.venues.map do |venue|
  #     {title: venue.title, latitude: venue.location.latitude, longitude: venue.location.longitude, handle: self.tender.handle, light_on: }
  #   # Post.joins(:comments).eager_load(:comments).map { |post| post.comments.size }
  # end 
