class AddColumnCodigoSeinfra < ActiveRecord::Migration[5.0]
  def change
  	add_column :servicos, :codigo_seinfra, :string
  end
end
