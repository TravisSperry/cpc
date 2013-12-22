module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "error"
    when :notice
      "success"
    else
      ""
    end
  end

  def pluralize_without_count(count, noun, text = nil)
  if count == 0
    "#{noun.pluralize}#{text}"
  else
    count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
  end
end
end
