class Document < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mount_uploader :file, DocumentUploader
  mount_uploader :file_preview, DocumentUploader
  validates :title, presence: true

  def thumbable?
     image? || pdf?
   end

  def preview
    convert_to_image if thumbable?
  end

  index_name [Rails.env, model_name.collection.gsub(/\//, '-')].join('_')

  private

    def convert_to_image
      document = MiniMagick::Image.open(file.path)
      document.format("png", 0)
      document.write("#{CarrierWave.root}/#{file_preview.store_dir}/#{file.org_filename}.png")
      document
    end

    def image?
      file.content_type == 'image/png' || file.content_type == 'image/jpeg' || file.content_type == 'image/jpeg'
    end

    def pdf?
      file.content_type == 'application/pdf' || file.content_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    end
end
