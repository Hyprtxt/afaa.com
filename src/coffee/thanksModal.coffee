jQuery ( $ ) ->
  if window.location.hash is '#formThanks'
    $thanks = $ '#thanks'
    $thanks.modal()
    window.location.hash = ''

  # Hack to fix sitefinity spacing on the HP
  if $('.mobile-nav-spacer')[1]
    $('.mobile-nav-spacer')[1].remove()
