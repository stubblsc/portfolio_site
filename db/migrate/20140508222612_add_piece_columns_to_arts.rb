class AddPieceColumnsToArts < ActiveRecord::Migration
  def self.up
    add_attachment :arts, :piece
  end

  def self.down
    remove_attachment :arts, :piece
  end
end