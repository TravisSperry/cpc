module CustomersHelper
  def disable_with_contact(customer)
    customer.primary_contact_id? ? '' : "disabled"
  end
end
