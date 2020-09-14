class RemoveStoredIdFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :storeId, :integer
  end
end
