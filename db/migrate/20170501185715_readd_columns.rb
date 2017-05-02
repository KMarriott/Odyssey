class ReaddColumns < ActiveRecord::Migration[5.0]
  def change
      add_column :paris, :name, :string
      add_column :paris, :image, :string
      add_column :paris, :flight, :string
      add_column :paris, :flight_date, :string
      add_column :paris, :address, :string
      add_column :paris, :profile_image, :string
  end
end
