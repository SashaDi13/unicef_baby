class DocumentUploader < CarrierWave::Uploader::Base
  require 'carrierwave/orm/activerecord'
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :aws
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def org_filename
    filename.chomp(File.extname(filename)) if original_filename.present?
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  version :thumb do
    process resize_to_fit: [400,800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg png doc docx pdf)
  end
end
