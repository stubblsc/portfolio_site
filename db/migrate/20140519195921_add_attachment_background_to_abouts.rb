class AddAttachmentBackgroundToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :background
    end
  end

  def self.down
    drop_attached_file :abouts, :background
  end
end
