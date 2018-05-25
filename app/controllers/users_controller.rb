class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
    @users = User.all
    @default_location = Venue.find(2).venue_marker_data
    @markers = User.first.get_locations
    # respond_to do |format|
    #   format.json {
    #     lat = params["lat"]
    #     lng = params["lng"]
    #   }
    # end
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

    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.create(user_params)
      puts params
      @user.build_location(address: "90 John St, New York, NY, 10038"]).save
      if params[:role] == true
        @user.add_role :tender
        @user.save
      end
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
        # location_params = (params[:user] || {})[:location_attributes].keys
        params.require(:user).permit(:first, :last, :handle, :email, :password)
      end
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :handle, {location_attributes: [:address]}])
      end
end
