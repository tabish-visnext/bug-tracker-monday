class AddForeignKeysToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :creator_id, :integer
    add_column :projects, :assignee_id, :integer
    

  end
end
