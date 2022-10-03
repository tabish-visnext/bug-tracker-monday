class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string "title"
      t.string "status"
      t.integer "bug_type", default: 0
      

      
    end
  end
end
