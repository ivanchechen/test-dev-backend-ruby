class RemoveExternalCoreFromCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :externalCore, :string
  end
end
