#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui
#= require bootstrap-sprockets
#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
#= require dataTables/extras/dataTables.responsive
#= require unslider

jQuery ->
  $('.datatable').DataTable
    responsive: true,
    pagingType: 'simple'
    order:      [[ 0, "desc" ]]

  $('.main').unslider
    animation: 'vertical'
    autoplay: true
    infinite: true
    arrows: false
    nav: false
    speed: 1000
    delay: 6500
