#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require popper
#= require bootstrap
#= require moment
#= require cocoon
#= require bootstrap-datetimepicker
#= require dataTables/jquery.dataTables
#= require dataTables/extras/dataTables.responsive
#= require chosen-jquery
#= require calculator
#= require customers
#= require bootstrap-slider
#= require work_orders
#= require powders

jQuery ->
  $('.datatable').DataTable
    ordering: false
    responsive: true,
    pagingType: 'simple',
    order:      [[ 0, "desc" ]]

  $('.chosen').chosen
    allow_single_deselect: true

  $('.datetimepicker').datetimepicker
    format: 'YYYY-MM-DD HH:mm'
    ignoreReadonly: true
    showClear: true,
    sideBySide: true,
    icons:
      time: 'far fa-clock',
      date: 'far fa-calendar-alt',
      up: 'fas fa-chevron-up',
      down: 'fas fa-chevron-down',
      previous: 'fas fa-chevron-left',
      next: 'fas fa-chevron-right',
      today: 'fas fa-screenshot',
      clear: 'far fa-trash-alt',
      close: 'far fa-times-circle'
