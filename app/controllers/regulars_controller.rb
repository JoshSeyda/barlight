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
      user_results = User.where("concat_ws(' ', lower(handle), lower(first), lower(last)) ILIKE ?", "%#{@parameter.squish}%")
      @tender_results = user_results.map { |user| user if user.has_role?(:tender) }
      # ("lower(handle) LIKE :search OR lower(first) LIKE :search OR lower(last) LIKE :search LIKE :search", search: "%#{@parameter}%")
      @venue_results = Venue.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
      if @tender_results.any? || @venue_results
        @results = true 
      else
        @results = false
      end
      #redirect to regulars and render search partial 
    end
  end

  # def new
  #   @user = User.new
  # end

  # def edit
  # end

  def create
    customer = User.find(current_user.id)
    tender = User.find(params[:id])
    if Regular.find_by(tender_id: tender.id, customer_id: customer.id).empty?
      @following = Regular.create(tender_id: tender.id, customer_id: customer.id)
      if @following.save
        # Handle a successful creation
        respond_to do |format|
          format.html { redirect_to user_regulars_path(current_user.id)}
          format.js
        end
      else
        render 'search'
      end
    end 
  end

  # def update
  #   @user.update(user_params)
  # end

    def destroy
      if params[:delete_customer] == true 
        @regular = Regular.where(tender_id: current_user.id, customer_id: params[:id])
      else
        @regular = Regular.where(tender_id: params[:id], customer_id: current_user.id)
      end
      @regular.destroy
      respond_to do |format|
        format.html {redirect_to user_regulars_path(current_user)}
        format.js
      end
    end 

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # def user_params
    #   params.require(:user).permit(:first, :last, :handle, :email, :password, :type)
    # end

end
