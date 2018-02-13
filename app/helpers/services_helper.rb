module ServicesHelper
  def badgeify(service)
    case service.name
    when 'Sand Blasting'
      content_tag :span, 'Sand Blasting', class: 'badge badge-warning'
    when 'Powder Coating'
      content_tag :span, 'Powder Coating', class: 'badge badge-secondary'
    when 'Fabrication'
      content_tag :span, 'Fabrication', class: 'badge badge-info'
    when 'Other/Repair/Shop Service'
      content_tag :span, 'Other', class: 'badge badge-dark'
    end
  end
end
