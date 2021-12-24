class AddAgeAndSubjectToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :age, :string
    add_column :articles, :subject, :string
  end
end
