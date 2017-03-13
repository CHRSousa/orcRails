class AddColumnItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :tipo_servicos, :item, :string
  end
end
