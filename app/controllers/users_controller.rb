class UsersController < ApplicationController

  def index
    @users = User.all
    @default_location = Venue.find(2).venue_marker_data
    @markers = User.first.get_locations
    #Alex Stuff:
    #Venue.near([40.71, -100.23], 50) will show the nearby locations and only pull those. Won't be helpful until we are refreshing the map with AJAX?
    #ie: open page, show results near default location (nycda for now), then once/if user location is given, send user location via AJAX call to refresh the map
    #Write a respond to statement in here, and when responding to js, grab the user location and geocode it, run the .near method on it, then send it back as the center point of the map
#     @venues = Venue.joins(:location).pluck(:latitude, :longitude, :id, :title)
#     @markers = @venues.map do |venue|
#       marker = Hash.new
#       marker[:lat] = venue[0]
#       marker[:lng] = venue[1]
#       marker[:enabled] = venue[2]
#       marker[:title] = venue[3]
#       marker
#     end
  end
    
    def show
      @default_location = Venue.find(2).venue_marker_data
      @user = User.find(params[:id])
      @markers = @user.get_locations
      puts @user 
      puts @markers 
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      @user.save
    end

    def update
      @user.update(user_params)
    end

    def destroy
      @user.destroy
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:first, :last, :handle, :email, :password, :type)
      end
end
