class CreateLinhas < ActiveRecord::Migration[5.0]
  def change
    create_table :linhas do |t|
      t.references :orcamento, foreign_key: true
      t.references :servico, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
