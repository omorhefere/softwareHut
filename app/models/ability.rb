class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    #Admins can manage all aspects of app. Users can read projects, articles
    #Users can create projects and comments
    if user.admin?
      can :manage, :all
    else
      can :read, Project
      can :read, Article
      can :create, Project
      can :create, Comment
    end

    #Users can delete and update only their own projects
    can [ :edit, :update, :destroy, :search ], Project do |project|
      project.user_id == user.id
    end

    #Users can delete ony their owm projects
    can [ :destroy ], Comment do |comment|
      @project.comment.commenter == user.email
    end

    #Users can only edit their own details
    can [ :read,:edit, :update, :destroy, :search ], User do |user|
      current_user.email == user.email
    end





    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
