#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require popper
#= require bootstrap
#= require dataTables/jquery.dataTables
#= require dataTables/extras/dataTables.responsive
#= require chosen-jquery
#= require unslider
#= require calculator
#= require bootstrap-slider

jQuery ->
  $('.datatable').DataTable
    responsive: true,
    pagingType: 'simple',
    order:      [[ 0, "desc" ]]

  $('.chosen').chosen()

  $('.main-slider').unslider
    autoplay: true
    infinite: true
    arrows: false
    nav: false
    delay: 6500

  $('.unslider').css('margin-top', '-60px')
