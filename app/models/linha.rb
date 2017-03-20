class Linha < ApplicationRecord
  belongs_to :orcamento
  belongs_to :servico
end
