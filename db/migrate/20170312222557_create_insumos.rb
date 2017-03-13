class CreateInsumos < ActiveRecord::Migration[5.0]
  def change
    create_table :insumos do |t|
      t.integer :codigo
      t.string :descricao
      t.string :codigo_seinfra
      t.references :unidade, foreign_key: true

      t.timestamps
    end
  end
end
