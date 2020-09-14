class RemoveDtOrderCreateFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :dtOrderCreate, :date
  end
end
