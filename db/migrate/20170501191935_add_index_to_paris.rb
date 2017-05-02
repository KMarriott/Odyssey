class AddIndexToParis < ActiveRecord::Migration[5.0]
  def change
    add_reference :paris, :user, foreign_key: true
  end
end
