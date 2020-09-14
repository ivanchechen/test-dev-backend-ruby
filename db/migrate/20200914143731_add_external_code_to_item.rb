class AddExternalCodeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :external_code, :string
  end
end
