class AddCustomerToInit < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :init
  end
end
