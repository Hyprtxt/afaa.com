jQuery ( $ ) ->
  if window.location.hash is '#formThanks'
    $thanks = $ '#thanks'
    $thanks.modal()
    window.location.hash = ''
