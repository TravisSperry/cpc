module WorkOrdersHelper
  def due_date_formatter(due_date, completed_date)
    return content_tag :span, 'No due date set.', class: 'text-danger' unless due_date
    if completed_date
      content_tag :span, "Completed on #{completed_date.strftime('%b %e, %l:%M %p')}", class: 'text-success'
    else
      case (due_date.to_date - Date.today).to_i
      when -Float::INFINITY..-1
        content_tag :span, "#{due_date.strftime('%b %e, %l:%M %p')} - Past Due", class: 'text-danger'
      when 0
        concat(content_tag :span, due_date.strftime('%b %e, %l:%M %p'), class: 'text-warning')
        concat ' - '
        content_tag :span, 'Due Today', class: 'text-success'
      else
        content_tag :span, due_date.strftime('%b %e, %l:%M %p'), class: 'text-success'
      end
    end
  end
end
