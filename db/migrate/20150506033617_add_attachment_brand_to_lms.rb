class AddAttachmentBrandToLms < ActiveRecord::Migration
  def self.up
    change_table :lms do |t|
      t.attachment :brand
    end
  end

  def self.down
    remove_attachment :lms, :brand
  end
end
