class NewTripsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :paris do |t|
      t.timestamps
    end
  end
end
