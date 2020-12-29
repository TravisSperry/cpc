class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :manage, :all if user.internal?

    can [:read, :update], User, customers_users: { customer: { id: user.customer_ids } }
    can :read, Customer, id: user.customer_ids
    can :read, WorkOrder, customer_id: user.customer_ids
  end
end
