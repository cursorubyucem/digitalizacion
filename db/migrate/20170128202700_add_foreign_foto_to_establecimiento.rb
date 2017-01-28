class AddForeignFotoToEstablecimiento < ActiveRecord::Migration
  def change
  	add_foreign_key :fotos, :establecimientos
  end
end
