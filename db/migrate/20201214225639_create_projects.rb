class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :brief_description
      t.string :main_photo
      t.text :main_description
      t.boolean :public, default: false
      t.integer :user_id
      t.integer :type_id

      t.timestamps
    end
  end
end
