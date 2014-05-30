class RemoveTypeIdFromSection < ActiveRecord::Migration
  def change
    remove_column :sections, :type_id, :integer
  end
end
