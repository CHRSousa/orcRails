class Insumo < ActiveRecord::Base

  belongs_to :unidade
  enum tipo: { 
  	'Material': 0, 
  	'Mão de Obra': 1,
  }
  has_many :composicao
  has_many :servico, through: :composicao

  filterrific(
  default_filter_params: { sorted_by: 'descricao_desc' },
  available_filters: [
  	:sorted_by,
    :search_query,
    :with_tipo,
    :with_unidade_id
  ]
)
  scope :search_query, lambda { |query|
  	where("descricao LIKE ?", "%#{query}%")  
  }

  scope :with_tipo, lambda { |tipos|
    where(tipo: [*tipos])
  }

  scope :with_unidade_id, lambda { |unidade_ids|
    where(unidade_id: [*unidade_ids])
  }

  scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^descricao/
	    order("LOWER(insumos.descricao) #{ direction }")
	  when /^unidade/
	    order("LOWER(insumos.unidade) #{ direction }")
	  when /^tipo/
	    order("LOWER(insumos.tipo) #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
  }

  def self.options_for_sorted_by
    [
      ['Tipo (a-z)', 'tipo_asc'],
      ['Tipo (z-a)', 'tipo_desc'],
      ['Descrição (a-z)', 'descricao_asc'],
      ['Descrição (z-a)', 'descricao_desc']
    ]
  end

  def self.options_for_select
    tipos.map do |tipo, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.tipos.#{tipo}"), tipo]
    end
  end
  
end
