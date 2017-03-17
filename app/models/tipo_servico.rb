class TipoServico < ActiveRecord::Base
	has_many :children, :class_name => "TipoServico", :foreign_key => "father_id"
    belongs_to :father, :class_name => "TipoServico"

    def self.options_for_select
  		order('LOWER(descricao)').map { |e| [e.descricao, e.id] }
  	end

  	def self.options_for_sorted_by
    [
      ['Item (a-z)', 'item_asc'],
      ['Descrição (a-z)', 'descricao_asc']
    ]
  end
end
