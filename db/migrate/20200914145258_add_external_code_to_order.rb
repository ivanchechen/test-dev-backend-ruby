class AddExternalCodeToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :external_code, :string
  end
end
