class Establecimiento < ActiveRecord::Base
	has_paper_trail
	has_many :fotos
	has_many :documentos
end
