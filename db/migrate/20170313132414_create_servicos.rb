class CreateServicos < ActiveRecord::Migration[5.0]
  def change
    create_table :servicos do |t|
      t.string :item
      t.string :descricao
      t.references :unidade, foreign_key: true
      t.references :tipo_servico, foreign_key: true

      t.timestamps
    end
  end
end
