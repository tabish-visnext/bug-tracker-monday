class Bug < ApplicationRecord
    belongs_to :project

    

    belongs_to :bug_creator, class_name: "User", foreign_key: "creator_id"
    belongs_to :bug_assignee, class_name: "User", foreign_key: "assignee_id"


    enum bug_type: [:feature, :bug]
end