if $(document.getElementById('calculator-form')).length > 0
  $(':input').bind 'keyup change', ->
    sum_costs()

  sum_costs = ->
    labor_cost = $('#labor_hours').val() * $('#labor_hours').data('rate')
    oven_cost = $('#oven_hours').val() * $('#oven_size').val()
    powder_cost = $('#powder_weight').val() * (parseFloat($('#powder_price').val()) || 0)
    soft_costs = labor_cost + oven_cost + powder_cost
    cob = soft_costs * (cost_of_business($("input[name='cost-of-business']").val()))
    total_cost = (cob + soft_costs) / (1 - margin($("input[name='margin']").val()))

    $('#total').find('span').html(total_cost.toFixed(2))

  cost_of_business = (selection) ->
    values = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45]
    values[parseInt(selection)]

  margin = (selection) ->
    values = [0.40, 0.48, 0.55, 0.62, 0.75]
    values[parseInt(selection)]
