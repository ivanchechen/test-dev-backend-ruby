class RemoveExternalCodeFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :externalCode, :string
  end
end
