$(document).on 'page:change', ->
  $('#alert_message').delay(2000).slideUp 500, ->
    $('.alert').alert 'close'
    return
  return