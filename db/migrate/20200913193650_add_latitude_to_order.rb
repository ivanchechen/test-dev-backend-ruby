class AddLatitudeToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :latitude, :string
  end
end
