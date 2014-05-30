class AddHeaderToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :header, :string
  end
end
