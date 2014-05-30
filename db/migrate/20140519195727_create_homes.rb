class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.text :text

      t.timestamps
    end
  end
end
