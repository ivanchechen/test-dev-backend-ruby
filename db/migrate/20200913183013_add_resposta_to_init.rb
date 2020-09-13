class AddRespostaToInit < ActiveRecord::Migration[6.0]
  def change
    add_column :inits, :resposta, :string
  end
end
