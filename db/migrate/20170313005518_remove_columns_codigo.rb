class RemoveColumnsCodigo < ActiveRecord::Migration[5.0]
  def change
  	remove_column :insumos, :codigo
  	remove_column :tipo_servicos, :codigo
  	remove_column :unidades, :codigo
  end
end
