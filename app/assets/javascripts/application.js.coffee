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
      time: 'icon icon-time',
      date: 'icon icon-calendar',
      up: 'icon icon-chevron-up',
      down: 'icon icon-chevron-down',
      previous: 'icon icon-chevron-left',
      next: 'icon icon-chevron-right',
      today: 'icon icon-screenshot',
      clear: 'icon icon-trash',
      close: 'icon icon-remove'
