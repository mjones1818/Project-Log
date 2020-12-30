class DropProjectTools < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_tools
  end
end
