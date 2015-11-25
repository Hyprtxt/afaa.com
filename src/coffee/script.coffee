console.log 'script loaded'

# $unbreaker = $ '.unbreaker'
# $unbreaker.remove()

jQuery ( $ ) ->
  $activeNavLinks = 'nav a[href^="/' + location.pathname.split("/")[1] + '"]'
  $activeNavLinks.addClass 'active'
