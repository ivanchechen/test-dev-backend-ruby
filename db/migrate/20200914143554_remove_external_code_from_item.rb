class RemoveExternalCodeFromItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :externalCode, :string
  end
end
