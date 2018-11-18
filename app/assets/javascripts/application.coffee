#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require popper
#= require bootstrap
#= require moment
#= require cocoon
#= require bootstrap-datetimepicker
#= require bootstrap-datepicker
#= require dataTables/jquery.dataTables
#= require dataTables/extras/dataTables.responsive
#= require chosen-jquery
#= require calculator
#= require sand_blasting_quote_calculator
#= require customers
#= require bootstrap-slider
#= require work_orders
#= require work_order_schedules
#= require powders

jQuery ->
  $('.datatable').DataTable
    responsive: true,
    pagingType: 'simple',
    order:      [[ 0, "desc" ]]

  $('.chosen').chosen
    allow_single_deselect: true

  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'

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
