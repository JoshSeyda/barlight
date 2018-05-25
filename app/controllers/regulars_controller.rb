class RegularsController < ApplicationController
  def index
    if current_user.has_role?(:tender)
      @customers = current_user.customers
    end
    @tenders = current_user.tenders
  end
    
  def show

  end
  
  def search  
    if params[:search].blank?  
      redirect_to(user_regulars_path(current_user), alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @user_results = User.all.where("lower(handle) LIKE :search", search: "%#{@parameter}%")
      @venue_results = Venue.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end

  # def new
  #   @user = User.new
  # end

  # def edit
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  # end

  # def update
  #   @user.update(user_params)
  # end

  # def destroy
  #   @user.destroy
  # end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # def user_params
    #   params.require(:user).permit(:first, :last, :handle, :email, :password, :type)
    # end

end
