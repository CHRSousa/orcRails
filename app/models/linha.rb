class Linha < ApplicationRecord
  belongs_to :orcamento, inverse_of: :linhas
  belongs_to :servico
end
