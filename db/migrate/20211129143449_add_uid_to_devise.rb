class AddUidToDevise < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :uid, :string
    add_column :admins, :provider, :string
  end
end
