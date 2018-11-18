# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
               concat content_tag(:button, '&times;'.html_safe, class: 'close', data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end

  def pluralize_without_count(count, noun, text = nil)
    if count == 0
      "#{noun.pluralize}#{text}"
    else
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
