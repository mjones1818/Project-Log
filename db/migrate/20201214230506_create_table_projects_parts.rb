class CreateTableProjectsParts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_parts do |t|
      t.integer :quantity
      t.integer :project_id
      t.integer :part_id
    end
  end
end
