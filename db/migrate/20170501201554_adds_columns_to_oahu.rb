class AddsColumnsToOahu < ActiveRecord::Migration[5.0]
  def change
    add_column :oahu,  :name, :string
    add_column :oahu,  :image, :string
    add_column :oahu,  :flight, :string
    add_column :oahu,  :flight_date, :string
    add_column :oahu,  :address, :string
    add_column :oahu,  :profile_image, :string

    add_reference :oahu, :user, foreign_key: true
  end
end
