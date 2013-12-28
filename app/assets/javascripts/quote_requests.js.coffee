# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $button = $("#cqr_button")
  $text = $("#cqr_text")
  $button.on "click", ->
    if $button.text() is 'Consumer Quote Request'
      $button.text('Industrial Quote Request')
      $text.text('Click button on right for Industrial Quote Form ')
      $text.append("<i class='icon icon-arrow-right'></i>")
      $('#quote_request_job_title').parent().hide()
      $('#quote_request_company_name').parent().hide()
      $('#quote_request_part_number').parent().hide()
      $('#quote_request_powder_product_code').parent().hide()
      $('#quote_request_powder_product_manufacturer').parent().hide()
      $('#quote_request_substrate').parent().hide()
      $('#quote_request_coating_requirements').parent().hide()
      $('#quote_request_paint_specs').parent().hide()
      $('#quote_request_packaging_requirements').parent().hide()
      $('#quote_request_masking_requirements').parent().hide()
      $('#quote_request_quantity_year').parent().hide()
      $('#quote_request_quantity_run').parent().hide()
    else if $button.text() is 'Industrial Quote Request'
      $button.text('Consumer Quote Request')
      $text.text('Click button on right for Consumer Quote Form ')
      $text.append("<i class='icon icon-arrow-right'></i>")
      $('#quote_request_job_title').parent().show()
      $('#quote_request_company_name').parent().show()
      $('#quote_request_part_number').parent().show()
      $('#quote_request_powder_product_code').parent().show()
      $('#quote_request_powder_product_manufacturer').parent().show()
      $('#quote_request_substrate').parent().show()
      $('#quote_request_coating_requirements').parent().show()
      $('#quote_request_paint_specs').parent().show()
      $('#quote_request_packaging_requirements').parent().show()
      $('#quote_request_masking_requirements').parent().show()
      $('#quote_request_quantity_year').parent().show()
      $('#quote_request_quantity_run').parent().show()

