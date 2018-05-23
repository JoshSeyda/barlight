class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true
  serialize :image_url
    # extend CarrierWave::Mount
    # extend CarrierWaveDirect::Mount
    # validates :title, presence: true, length: {minimum: 2}
    # validates :body, presence: true
    validates :image, file_size: { less_than: 1.megabytes }
    mount_uploader :image, ImageUploader
end
