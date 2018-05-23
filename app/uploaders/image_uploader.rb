class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # include CarrierWave::MimeTypes
  # process :set_content_type


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  def direct_fog_url
    "https://barlight-test.s3.amazonaws.com/"
  end
  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [350, 350]
  end
  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [20, 20]
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

    # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
    # include Sprockets::Helpers::RailsHelper
    # include Sprockets::Helpers::IsolatedHelper
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end