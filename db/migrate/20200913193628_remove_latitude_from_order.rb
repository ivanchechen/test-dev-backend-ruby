class RemoveLatitudeFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :latitude, :float
  end
end
