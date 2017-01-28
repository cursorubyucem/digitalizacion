class ForeignDocumentoToEstablecimiento < ActiveRecord::Migration
  def change
  	add_foreign_key :documentos, :establecimientos
  end
end
