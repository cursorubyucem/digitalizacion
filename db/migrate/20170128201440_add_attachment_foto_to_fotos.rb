class AddAttachmentFotoToFotos < ActiveRecord::Migration
  def self.up
    change_table :fotos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :fotos, :foto
  end
end
