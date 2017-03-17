class Servico < ApplicationRecord
  belongs_to :unidade
  belongs_to :tipo_servico
  has_many :composicao
  has_many :insumo, through: :composicao

filterrific(
  default_filter_params: { sorted_by: 'item_desc' },
  available_filters: [
  	:sorted_by,
    :search_query,
    :with_tipo_servico_id,
    :with_unidade_id
  ]
)
  scope :search_query, lambda { |query|
  	where("descricao LIKE ?", "%#{query}%")  
  }

  scope :with_tipo_servico_id, lambda { |tipo_servico_ids|
    where(tipo_servico_id: [*tipo_servico_ids])
  }

  scope :with_unidade_id, lambda { |unidade_ids|
    where(unidade_id: [*unidade_ids])
  }

  scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^descricao/
	    order("LOWER(servicos.descricao) #{ direction }")
	  when /^item/
	    order("LOWER(servicos.item) #{ direction }")
	  when /^tipo_servico/
	    order("LOWER(servicos.tipo_servico) #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
  }


  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ['Item (a-z)', 'item_asc'],
      ['Descrição (a-z)', 'descricao_asc']
    ]
  end

  def self.options_for_select
  	order('LOWER(descricao)').map { |e| [e.descricao, e.id] }
  end

end
