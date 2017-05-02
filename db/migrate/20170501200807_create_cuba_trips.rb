class CreateCubaTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :cuba_trips do |t|
      t.timestamps
    end
  end
end
