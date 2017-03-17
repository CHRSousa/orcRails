class AddColumnEspecificacao < ActiveRecord::Migration[5.0]
  def change
  	add_column :servicos, :especificacao, :text
  end
end
