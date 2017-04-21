class Ability
  include CanCan::Ability

  def initialize user, namespace=""
    can :read, Restaurant do |restaurant|
      restaurant.opening?
    end
    can :create, Restaurant
    can :order, Restaurant
    can :read, Food
    can :create, [Bill, BillDetail]
    can :create, User
    if user
      case
      when namespace.blank? && user.is_a?(User)
        can :manage, Bill, user_id: user.id
        can :manage, User, id: user.id
        can :update, Restaurant, manager_id: user.id
        can :manage, [Rate, Comment], user_id: user.id
      when namespace == "manager" && user.is_a?(User) && user.restaurant
        can :update, Restaurant, manager_id: user.id
        can :manage, Food, restaurant_id: user.restaurant.id
        can :manage, Bill, restaurant_id: user.restaurant.id
        can :manage, BillDetail
      when namespace == "admin" && user.is_a?(Admin)
        can :manage, :all
      end
    end
  end
end
