class DocumentUploader < CarrierWave::Uploader::Base
  require 'carrierwave/orm/activerecord'
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :aws
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  version :thumb, if: :thumbable? do
    process :preview
  end

  def preview
    manipulate! do |img|
      img.format("png", 0)
      img.resize("400x800")
      img = yield(img) if block_given?
      img
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg png doc docx pdf)
  end

  def thumbable?(file)
     image?(file) || pdf?(file)
   end

  def image?(file)
    file.content_type == 'image/png' || file.content_type == 'image/jpeg' || file.content_type == 'image/jpeg'
  end

  def pdf?(file)
    file.content_type == 'application/pdf' || file.content_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  end
end
