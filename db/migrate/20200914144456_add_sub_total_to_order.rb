class AddSubTotalToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :sub_total, :float
  end
end
