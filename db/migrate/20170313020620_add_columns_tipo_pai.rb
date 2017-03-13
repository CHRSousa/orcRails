class AddColumnsTipoPai < ActiveRecord::Migration[5.0]
def self.up     
      create_table :tipo_servicos do |t|       
      t.column :father_id, :integer, :references => :tipo_servicos
      t.column :descricao, :string
      t.column :item, :string
 
      t.timestamps
     end
  end
end
