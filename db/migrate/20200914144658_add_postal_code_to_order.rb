class AddPostalCodeToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :postal_code, :integer
  end
end
