class CreateInits < ActiveRecord::Migration[6.0]
  def change
    create_table :inits do |t|
      t.string :entrada

      t.timestamps
    end
  end
end
