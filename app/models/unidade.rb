class Unidade < ActiveRecord::Base
	def self.options_for_select
  		order('LOWER(sigla)').map { |e| [e.sigla, e.id] }
  	end
end
