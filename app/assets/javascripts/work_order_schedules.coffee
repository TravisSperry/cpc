# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.service-schedules').on 'cocoon:after-insert', ->
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
