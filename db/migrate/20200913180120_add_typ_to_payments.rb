class AddTypToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :typ, :string
  end
end
