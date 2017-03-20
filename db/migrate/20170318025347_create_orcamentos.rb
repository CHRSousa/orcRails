class CreateOrcamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :orcamentos do |t|
      t.references :obra, foreign_key: true
      t.string :nome_proprietario
      t.string :cpf_proprietario
      t.float :bdi

      t.timestamps
    end
  end
end
