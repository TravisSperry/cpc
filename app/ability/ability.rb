class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?
    can :create, User, customers_users: { group: { id: user.customer_ids } }
  end
end
