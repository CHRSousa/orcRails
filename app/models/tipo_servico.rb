class TipoServico < ApplicationRecord
	has_many :children, :class_name => "TipoServico", :foreign_key => "father_id"
    belongs_to :father, :class_name => "TipoServico"
end
