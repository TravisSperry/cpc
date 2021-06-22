if $(document.getElementById('calculator-form')).length > 0
  $(document).ready ->
    init_costs()

  $(':input').bind 'keyup change', ->
    sum_costs()

  init_costs = ->
    labor_cost = $('#quote_labor_hours').val() * $('#quote_labor_hours').data('rate')
    oven_cost = $('#quote_oven_hours').val() * $('#quote_hourly_oven_price').val()
    powder_cost = $('#quote_powder_pounds').val() * (parseFloat($('#quote_powder_price').val()) || 0)
    sandblasting_labor_cost = $('#quote_sandblasting_hours').val() * $('#quote_sandblasting_hours').data('rate')
    sandblasting_media_multiplier = $('#quote_sandblasting_media_multiplier').val()
    sandblasting_media_cost = sandblasting_labor_cost * sandblasting_media_multiplier
    cost_of_business_multiplier =  $('#quote_cost_of_business').val()
    soft_costs = labor_cost + oven_cost + powder_cost
    cost_of_business = soft_costs * cost_of_business_multiplier
    margins = $('#quote_pricing_scale').val()
    total_sandblasting_cost = (sandblasting_labor_cost + sandblasting_media_cost) / (1 - margins)
    coating_costs = ((cost_of_business + soft_costs) / (1 - margins))
    total_cost = coating_costs + total_sandblasting_cost
    $('#coating_costs').find('span').html(coating_costs.toFixed(2))
    $('#sandblasting_costs').find('span').html(total_sandblasting_cost.toFixed(2))
    $('#total').find('span').html(total_cost.toFixed(2))

  sum_costs = ->
    labor_cost = $('#quote_labor_hours').val() * $('#quote_labor_hours').data('rate')
    oven_cost = $('#quote_oven_hours').val() * $('#quote_hourly_oven_price').val()
    powder_cost = $('#quote_powder_pounds').val() * (parseFloat($('#quote_powder_price').val()) || 0)
    sandblasting_labor_cost = $('#quote_sandblasting_hours').val() * $('#quote_sandblasting_hours').data('rate')
    sandblasting_media_multiplier = $('#quote_sandblasting_media_multiplier').val()
    sandblasting_media_cost = sandblasting_labor_cost * sandblasting_media_multiplier
    cost_of_business_multiplier = cost_of_business_mult($("input[name='cost-of-business']").val())
    soft_costs = labor_cost + oven_cost + powder_cost
    cost_of_business = soft_costs * cost_of_business_multiplier
    margins = margin($("input[name='margin']").val())
    total_sandblasting_cost = (sandblasting_labor_cost + sandblasting_media_cost) / (1 - margins)
    coating_costs = ((cost_of_business + soft_costs) / (1 - margins))
    total_cost = coating_costs + total_sandblasting_cost
    $('#coating_costs').find('span').html(coating_costs.toFixed(2))
    $('#sandblasting_costs').find('span').html(total_sandblasting_cost.toFixed(2))
    $('#total').find('span').html(total_cost.toFixed(2))

  cost_of_business_mult = (selection) ->
    # load values from quote form object via data attr
    values = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45]
    value = values[parseInt(selection)]
    $('#quote_cost_of_business').val(value)
    value

  margin = (selection) ->
    # load values from quote form object via data attr
    values = [0.40, 0.48, 0.55, 0.62, 0.75]
    value = values[parseInt(selection)]
    $('#quote_pricing_scale').val(value)
    value
