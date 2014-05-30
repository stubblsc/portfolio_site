class AddSectionIdToArts < ActiveRecord::Migration
  def change
    add_column :arts, :section_id, :integer
  end
end
