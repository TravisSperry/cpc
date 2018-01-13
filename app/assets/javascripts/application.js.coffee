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
      time: 'fa fa-time',
      date: 'fa fa-calendar',
      up: 'fa fa-chevron-up',
      down: 'fa fa-chevron-down',
      previous: 'fa fa-chevron-left',
      next: 'fa fa-chevron-right',
      today: 'fa fa-screenshot',
      clear: 'fa fa-trash',
      close: 'fa fa-remove'
