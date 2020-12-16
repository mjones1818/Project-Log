class CreateProjectsTools < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tools do |t|
      t.integer :quantity
      t.integer :project_id
      t.integer :tool_id
    end
  end
end
