class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update]
    # before_action :set_s3_direct_image, only: [:new, :edit, :create, :update]
   
    def index
      @images = Image.order('created_at DESC')
      @image = Image.new
      @uploader = ImageUploader.new
      # @uploader.key = "uploads/#{@image.id}-#{request.ip}/${filename}"
      # @uploader.success_action_status = "201"
      @uploader.success_action_redirect = new_image_url
    end
   
    def show
      @image= Image.find(params[:id])
    end
   
    def new
      @image = Image.new
      
    end
   
    def create
      @image = Image.new(image_params).save
      if @image.save
        redirect_to images_path
      else
        render :new
      end
    end
   
    def edit
    end
   
    def update
      if @image.update_attributes(image_params)
        redirect_to image_path(@image)
      else
        render :edit
      end
    end
   
    private
   
    def image_params
        params.require(:image).permit( :url, :imageable_id)
    end
   
    def set_image
      @image = Image.find(params[:id])
    end

    # def set_s3_direct_image
    #   @s3_direct_image = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    # end

end
