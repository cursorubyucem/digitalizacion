class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.integer :establecimiento_id, null: false

      t.timestamps null: false
    end
  end
end
