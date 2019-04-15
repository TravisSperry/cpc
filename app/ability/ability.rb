class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?

    can [:read, :update], User, customers_users: { customer: { id: user.customer_ids } }
    can :read, Customer, id: user.customer_ids
  end
end
