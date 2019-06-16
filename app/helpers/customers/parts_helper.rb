module Customers::PartsHelper

  def part_archive_confirm(part)
    quantity = part.quantity
    if quantity > 0
      "#{pluralize(quantity, 'PART')} IN INVENTORY. Are you sure you want to archive this part?"
    else
      'Are you sure you want to archive this part?'
    end
  end
end
