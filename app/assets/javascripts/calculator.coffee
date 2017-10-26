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
  total_cost = total_cost * (1 + cost_of_business($("input[name='cost-of-business']").val()))
  total_cost = total_cost * (1 + margin($("input[name='margin']").val()))
  total_cost.toFixed(2)

cost_of_business = (selection) ->
  values = [0.05, 0.075, 0.1, 0.125, 0.15, 0.175]
  values[parseInt(selection)]

margin = (selection) ->
  values = [.35, .425, .525, .6]
  values[parseInt(selection)]
