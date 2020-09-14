class RemoveSubTotalFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :subTotal, :float
  end
end
