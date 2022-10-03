class User < ApplicationRecord
      

    has_many :user_projects
    has_many :projects, through: :user_projects

    has_many :created_projects, class_name: "Project", foreign_key: "creator_id"

    has_many :created_bugs, class_name: "Bug", foreign_key: "creator_id"
    has_many :assigned_bugs, class_name: "Bug", foreign_key: "assignee_id"




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  enum role: [:qa, :manager, :developer]
  

  
  
end