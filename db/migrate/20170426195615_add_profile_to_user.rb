class AddProfileToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :image, :string
    add_column :users, :flight, :string
    add_column :users, :flight_date, :string
    add_column :users, :address, :string
    add_column :users, :profile_image, :string
  end
end
