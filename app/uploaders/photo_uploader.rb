class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :avatar do
    cloudinary_transformation effect: "brightness:30",
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
