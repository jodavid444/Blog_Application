class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.role == 'admin'

    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id

    can :create, Post
    can :create, Comment

    can :read, Post
    can :read, Comment
  end
end
