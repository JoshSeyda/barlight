class UsersController < ApplicationController

  def index
    #Venue.near([40.71, -100.23], 50) will show the nearby locations and only pull those. Won't be helpful until we are refreshing the map with AJAX?
    #ie: open page, show results near default location (nycda for now), then once/if user location is given, send user location via AJAX call to refresh the map
    #Write a respond to statement in here, and when responding to js, grab the user location and geocode it, run the .near method on it, then send it back as the center point of the map
    @venues = Venue.joins(:location).pluck(:latitude, :longitude, :id, :title)
    @markers = @venues.map do |venue|
      marker = Hash.new
      marker[:lat] = venue[0]
      marker[:lng] = venue[1]
      marker[:enabled] = venue[2]
      marker[:title] = venue[3]
      marker
    end
  end
end
