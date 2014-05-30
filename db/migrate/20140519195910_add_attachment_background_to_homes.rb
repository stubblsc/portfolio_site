class AddAttachmentBackgroundToHomes < ActiveRecord::Migration
  def self.up
    change_table :homes do |t|
      t.attachment :background
    end
  end

  def self.down
    drop_attached_file :homes, :background
  end
end
