class CreateEstablecimientos < ActiveRecord::Migration
  def change
    create_table :establecimientos do |t|
      t.string :nombre, null: false, limit: 250

      t.timestamps null: false
    end
  end
end
