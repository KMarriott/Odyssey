class AddColumnsToCubaProbablyAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :cuba_trips,  :name, :string
    add_column :cuba_trips,  :image, :string
    add_column :cuba_trips,  :flight, :string
    add_column :cuba_trips,  :flight_date, :string
    add_column :cuba_trips,  :address, :string
    add_column :cuba_trips,  :profile_image, :string

    add_reference :cuba_trips, :user, foreign_key: true
  end
end
