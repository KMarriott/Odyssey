class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
