class Orcamento < ApplicationRecord
	has_many :linhas
	accepts_nested_attributes_for :linhas, 
	                              :allow_destroy => true, 
	                              reject_if: lambda { |attributes| attributes[:quantidade].blank? }


	filterrific(
  		default_filter_params: { sorted_by: 'data_desc' },
  		available_filters: [
  			:sorted_by,
    		:search_query,
    		:with_data,
    		:with_obra_id
  		]
	)
  
	scope :search_query, lambda { |query|
	  	where("nome_proprietario LIKE ?", "%#{query}%")  
	}

	scope :with_obra_id, lambda { |obra_ids|
	    where(obra_id: [*obra_ids])
	}

	scope :sorted_by, lambda { |sort_option|
		  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
		  case sort_option.to_s
		  when /^nome_proprietario/
		    order("LOWER(orcamentos.nome_proprietario) #{ direction }")
		  when /^obra/
		    order("LOWER(orcamentos.obra) #{ direction }")
		  when /^data/
		    order("LOWER(orcamentos.data) #{ direction }")
		  else
		    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
		  end
	  }

	  def self.options_for_sorted_by
	    [
	      ['Proprietário (a-z)', 'nome_proprietario_asc'],
	      ['Proprietário (z-a)', 'nome_proprietario_desc'],
	      ['Data asc', 'data_asc'],
	      ['Data desc', 'data_desc']
	    ]
	  end

end
