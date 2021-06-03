if $(document.getElementById('calculator-form')).length > 0
  $(':input').bind 'keyup change', ->
    sum_costs()

  sum_costs = ->
    labor_cost = $('#quote_labor_hours').val() * $('#quote_labor_hours').data('rate')
    oven_cost = $('#quote_oven_hours').val() * $('#quote_hourly_oven_price').val()
    powder_cost = $('#quote_powder_pounds').val() * (parseFloat($('#quote_powder_price').val()) || 0)
    soft_costs = labor_cost + oven_cost + powder_cost
    cobs = soft_costs * (cost_of_business($("input[name='cost-of-business']").val()))
    margins = margin($("input[name='margin']").val())
    total_cost = (cobs + soft_costs) / (1 - margins)

    $('#quote_cost_of_business').val(cobs)
    $('#quote_pricing_scale').val(margins)
    
    $('#total').find('span').html(total_cost.toFixed(2))

  cost_of_business = (selection) ->
    values = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45]
    values[parseInt(selection)]

  margin = (selection) ->
    values = [0.40, 0.48, 0.55, 0.62, 0.75]
    values[parseInt(selection)]
