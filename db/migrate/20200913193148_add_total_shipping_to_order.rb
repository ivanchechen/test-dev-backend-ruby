class AddTotalShippingToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total_shipping, :float
  end
end
