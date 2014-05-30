class AddHeaderToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :header, :string
  end
end
