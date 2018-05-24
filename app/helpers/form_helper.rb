module FormHelper
    def setup_user(user)
      user.location ||= Location.new
      user.build_location(address: params[:address]).save
      user
    end
  end