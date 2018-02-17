module CustomersHelper
  def disable_with_contact(customer)
    customer.primary_contact_id? || customer.individual? ? '' : "disabled"
  end
end
