class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :image, :string
    remove_column :users, :flight, :string
    remove_column :users, :flight_date, :string
    remove_column :users, :address, :string
    remove_column :users, :profile_image, :string
    add_column :trips,  :first_name, :string
    add_column :trips,  :last_name, :string
    add_column :trips,  :image, :string
    add_column :trips,  :flight, :string
    add_column :trips,  :flight_date, :string
    add_column :trips,  :address, :string
    add_column :trips,  :profile_image, :string
  end
end
