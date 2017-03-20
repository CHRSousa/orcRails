class AddColumnDate < ActiveRecord::Migration[5.0]
  def change
  	add_column :orcamentos, :data, :date
  end
end
