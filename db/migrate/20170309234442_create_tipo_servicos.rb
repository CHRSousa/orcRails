class CreateTipoServicos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicos do |t|
      t.integer :codigo
      t.string :descricao

      t.timestamps
    end
  end
end
