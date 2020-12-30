class DropTools < ActiveRecord::Migration[6.0]
  def change
    drop_table :tools
  end
end
