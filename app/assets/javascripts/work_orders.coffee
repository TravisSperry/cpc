$(".add-line-items a").
  data("association-insertion-method", 'prepend').
  data "association-insertion-node", (link) ->
    return link.closest('tbody').last('tr')

$(".work-order-navbar").hover ()->
  if $(".add-work-order").hasClass('disabled') and $(".chevron").length is 0
    $(".add-contact").after('<span class="chevron bounce"></span>')
    $(".chevron").css
      'z-index': 1,
      position: 'fixed',
      left: $(".add-contact").offset().left + 25 + $(".add-contact").width()/2,
      top: $(this).position().top + $(".add-contact").height()*2

    $("#addContactModal").modal('show')

$(window).resize ->
  $(".chevron").css
    'z-index': 1,
    position: 'fixed',
    left: $(".add-contact").offset().left + 20 + $(".add-contact").width()/2,
    top: $(".work-order-navbar").position().top + $(".add-contact").height()*2
