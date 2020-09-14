class AddStoredIdToOreder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :store_id, :integer
  end
end
