class Schedule < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :recurring_events 


  def venues
    Venue.joins([{event: :schedule}, {recurring_event: :schedule}])
           .where(schedules: {id: self.id})
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
