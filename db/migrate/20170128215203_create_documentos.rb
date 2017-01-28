class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.integer :establecimiento_id, null: false

      t.timestamps null: false
    end
  end
end
