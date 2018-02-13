# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.powder-chosen').chosen
  allow_single_deselect: true
  placeholder_text_single: 'Select a Powder'

$('.line-item-fields').on 'cocoon:after-insert', ->
  $('.powder-chosen').chosen
    allow_single_deselect: true
    placeholder_text_single: 'Select a Powder'
