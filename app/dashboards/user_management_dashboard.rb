class UserManagementDashboard
  def initialize(current_user)
    @current_user = current_user
  end

  def active_internal_users
    User.where(user_type: UserType.for(:internal)).where.not(id: current_user.id)
  end

  def inactive_internal_users
    User.only_deleted.where(user_type: UserType.for(:internal))
  end

  def active_customer_users
    User.where(user_type: UserType.for(:customer)).where.not(id: current_user.id)
  end

  def inactive_customer_users
    User.only_deleted.where(user_type: UserType.for(:customer))
  end

  private

  attr_reader :current_user
end
