class Project < ApplicationRecord
    
    has_many :user_projects
    has_many :users, through: :user_projects

    belongs_to :project_creator, class_name: "User", foreign_key: "creator_id"

    has_many :bugs     

end