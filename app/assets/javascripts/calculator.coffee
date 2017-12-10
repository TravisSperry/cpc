 if $(document.getElementById('calculator-form')).length > 0
  $(':input').bind 'keyup change', ->
    sum_costs()

  sum_costs = ->
    labor_cost = $('#labor_hours').val() * 80
    oven_cost = $('#oven_hours').val() * $('#oven_size').val()
    powder_cost = $('#powder_weight').val() * (parseFloat($('#powder_price').val()) || 0)
    soft_costs = labor_cost + oven_cost + powder_cost
    cob = soft_costs * (cost_of_business($("input[name='cost-of-business']").val()))
    total_cost = (cob + soft_costs) / (1 - margin($("input[name='margin']").val()))


    $('#subtotal').find('span').html((soft_costs + cob).toFixed(2))
    $('#total').find('span').html(total_cost.toFixed(2))
    console.log 1 - margin($("input[name='margin']").val())

  cost_of_business = (selection) ->
    values = [0.05, 0.075, 0.1, 0.125, 0.15, 0.175]
    values[parseInt(selection)]

  margin = (selection) ->
    values = [0.35, 0.425, 0.525, 0.6, 0.65]
    values[parseInt(selection)]
