class ChangeOahus < ActiveRecord::Migration[5.0]
  def change
    add_column :oahus,  :name, :string
    add_column :oahus,  :image, :string
    add_column :oahus,  :flight, :string
    add_column :oahus,  :flight_date, :string
    add_column :oahus,  :address, :string
    add_column :oahus,  :profile_image, :string

    add_reference :oahus, :user, foreign_key: true
  end
end
