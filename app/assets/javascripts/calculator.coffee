$(':input').bind 'keyup change', ->
  calculate_total()

calculate_total = ->
  $('#subtotal').find('span').html(sum_costs())
  $('#total').find('span').html(sum_costs())

sum_costs = ->
  labor_cost = $('#labor_hours').val() * 100
  oven_cost = $('#oven_hours').val() * $('#oven_size').val()
  powder_cost = $('#powder_weight').val() * $('#powder_type').val()
  total_cost = labor_cost + oven_cost + powder_cost
  total_cost.toFixed(2)
