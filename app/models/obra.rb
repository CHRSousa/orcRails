class Obra < ActiveRecord::Base
	filterrific(
 		default_filter_params: { sorted_by: 'descricao_desc' },
  		available_filters: [
  			:sorted_by,
    		:search_query
  		]
	)

	scope :search_query, lambda { |query|
  		where("descricao LIKE ?", "%#{query}%")  
  	}

  	scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^descricao/
	    order("LOWER(obras.descricao) #{ direction }")
    when /^local/
      order("LOWER(obras.local) #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
  	}

  	def self.options_for_sorted_by 
  		[
      	  ['Descrição (a-z)', 'descricao_asc'],
          ['Descrição (z-a)', 'descricao_desc'],
          ['Local (a-z)', 'local_asc'],
          ['Local (z-a)', 'local_desc']
    	]
  	end
	
	def self.options_for_select
  		order('LOWER(descricao)').map { |o| [o.descricao, o.id] }
  end
end
