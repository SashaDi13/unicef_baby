class AddFilePreviewForDocument < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :file_preview, :string
  end
end
