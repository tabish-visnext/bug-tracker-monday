class DropBugs < ActiveRecord::Migration[7.0]
  def change 
    drop_table :bugs
  end
end
