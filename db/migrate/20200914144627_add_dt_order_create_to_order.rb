class AddDtOrderCreateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :dt_order_create, :date
  end
end
