class AddProcessamentoToInit < ActiveRecord::Migration[6.0]
  def change
    add_column :inits, :processamento, :string
  end
end
