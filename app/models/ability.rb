class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can :read, [Category,Product]
    elsif user.role? "admin"
        can :manage, [Category,Product,Review]
    elsif user.role? "moderator"
        can :read, [Category, Product, Review]
        can :create, Review
        can :update, [Category, Product]
        can :destroy, Review    
    elsif user.role? "customer"
        can :read, [Category, Product]
        can [:read, :create], Review
        can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end
    end
  end
end
