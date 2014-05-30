class RemoveSubsectionIdFromArts < ActiveRecord::Migration
  def change
    remove_column :arts, :subsection_id, :integer
  end
end
