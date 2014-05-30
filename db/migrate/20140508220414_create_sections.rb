class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :type_id
      t.boolean :has_subsection

      t.timestamps
    end
  end
end
