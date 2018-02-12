# toggle button text based on customer account type
$('#customer_account_type').on 'change', ->
  customer_type = $(this).val()[0].toUpperCase() + $(this).val().substr(1)
  $('.customer_name').find('label').text(customer_type + ' ' + 'name')
