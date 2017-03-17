class TipoServico < ActiveRecord::Base
	has_many :children, :class_name => "TipoServico", :foreign_key => "father_id"
  belongs_to :father, :class_name => "TipoServico"

  filterrific(
    default_filter_params: { sorted_by: 'item_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_father_id
    ]
  )

  scope :search_query, lambda { |query|
    where("descricao LIKE ?", "%#{query}%")  
  }

  scope :with_father_id, lambda { |father_ids|
    where(father_id: [*father_ids])
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^descricao/
      order("LOWER(tipo_servicos.descricao) #{ direction }")
    when /^item/
      order("LOWER(tipo_servicos.item) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
    def self.options_for_select
  		order('LOWER(descricao)').map { |e| [e.descricao, e.id] }
  	end

  	def self.options_for_sorted_by
    [
      ['Item (a-z)', 'item_asc'],
      ['Item (z-a)', 'item_desc'],
      ['Descrição (a-z)', 'descricao_asc'],
      ['Descrição (z-a)', 'descricao_desc']
    ]
  end
end
