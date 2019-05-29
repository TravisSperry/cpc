class CustomerUserConstraint
  def self.matches?(request)
    current_user = request.env['warden'].user
    current_user.present? && current_user.respond_to?(:user_type?) && current_user.user_type?(:customer)
  end
end
