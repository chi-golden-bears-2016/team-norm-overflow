class AvatarUploader < CarrierWave::Uploader::Base
  def store_dir
    'public/images'
  end
end