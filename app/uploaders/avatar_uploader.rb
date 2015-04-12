# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

 # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_fill: [256, 256]

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # This is my attempted solution
  def fix_exif_rotation
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end

  process :fix_exif_rotation
end
