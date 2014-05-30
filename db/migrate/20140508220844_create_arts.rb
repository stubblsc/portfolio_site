class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.integer :subsection_id
      t.string :medium
      t.text :description

      t.timestamps
    end
  end
end
