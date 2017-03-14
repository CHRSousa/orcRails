class AddColumnTipoInsumo < ActiveRecord::Migration[5.0]
  def change
  	add_column :insumos, :tipo, :integer, default:0, index: true
  end
end
