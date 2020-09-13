class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :externalCode
      t.integer :storeId
      t.float :subTotal
      t.float :deliveryFee
      t.float :total
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.float :latitude
      t.float :longitude
      t.date :dtOrderCreate
      t.integer :postalCode
      t.integer :number
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
