class AddDeliveryFeeToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivery_fee, :float
  end
end
