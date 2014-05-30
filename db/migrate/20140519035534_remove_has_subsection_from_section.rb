class RemoveHasSubsectionFromSection < ActiveRecord::Migration
  def change
    remove_column :sections, :has_subsection, :integer
  end
end
