class AddOrderToArts < ActiveRecord::Migration
  def change
    add_column :arts, :order, :integer
  end
end
