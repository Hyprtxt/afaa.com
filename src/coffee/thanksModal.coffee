jQuery ( $ ) ->
  if window.location.hash is '#formThanks'
    $thanks = $ '#thanks'
    $thanks.modal()
    window.location.hash = ''

  $('.mobile-nav-spacer')[1].remove()
