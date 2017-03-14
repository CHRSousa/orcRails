class Insumo < ApplicationRecord
  belongs_to :unidade
  enum tipo: { 
  	'Material': 0, 
  	'Mão de Obra': 1,
  }
end
