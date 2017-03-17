class CreateComposicaos < ActiveRecord::Migration[5.0]
  def change
    create_table :composicaos do |t|
      t.float :coeficiente
      t.references :insumo, foreign_key: true
      t.references :servico, foreign_key: true

      t.timestamps
    end
  end
end
