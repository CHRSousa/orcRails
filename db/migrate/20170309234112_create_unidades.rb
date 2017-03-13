class CreateUnidades < ActiveRecord::Migration[5.0]
  def change
    create_table :unidades do |t|
      t.integer :codigo
      t.string :descricao
      t.string :sigla
      t.integer :qtd_dimensao
      t.boolean :monetaria

      t.timestamps
    end
  end
end
