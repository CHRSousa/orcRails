class AddColumnVlUnit < ActiveRecord::Migration[5.0]
  def change
  	add_column :servicos, :vl_unidade, :float
  end
end
