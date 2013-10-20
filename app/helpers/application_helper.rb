module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "error"
    when :notice
      "notice"
    else
      ""
    end
  end
end
