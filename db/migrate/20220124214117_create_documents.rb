class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :file
      t.timestamps
    end
  end
end
