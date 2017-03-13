class Servico < ApplicationRecord
  belongs_to :unidade
  belongs_to :tipo_servico
end
