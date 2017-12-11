$(".add-line-items a").
  data("association-insertion-method", 'prepend').
  data "association-insertion-node", (link) ->
    return link.closest('tbody').last('tr')
