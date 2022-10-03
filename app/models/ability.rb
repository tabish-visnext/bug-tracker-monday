# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user
    if current_user.role == 'manager'
      
      can :read, User
      can :read, Project
      can :read, Bug
      can :create, Project
      can :edit, Project
      can :update, Project
      can :destroy, Project
    end


    if current_user.role == 'developer'
      
      can :read, User
      can :read, Project
      can :read, Bug
      can :edit, Bug
      can :update, Bug
    end

    
     
    if current_user.role == 'qa'
      
      can :read, User
      can :read, Project
      can :read, Bug
      can :create, Bug
      can :destroy, Bug
    end
  end
    

   

    
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
