if $(document.getElementById('sand-blasting-calculator-form')).length > 0
  console.log 'sandblasting!'
  $(':input').bind 'keyup change', ->
    sum_costs()

  sum_costs = ->
    labor_cost = $('#labor_hours').val() * $('#labor_hours').data('rate')
    media_cost = labor_cost * 0.125
    soft_costs = media_cost + labor_cost
    total_cost = soft_costs / (1 - margin($("input[name='margin']").val()))

    $('#total').find('span').html(total_cost.toFixed(2))

  cost_of_business = (selection) ->
    values = [0.1, 0.2, 0.3]
    values[parseInt(selection)]

  margin = (selection) ->
    values = [0.40, 0.48, 0.55, 0.62, 0.75]
    values[parseInt(selection)]
