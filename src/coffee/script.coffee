console.log 'script loaded'

# Activate active nav links
path = location.pathname.split("/")
path.shift()
$activeNavLinks = $ 'a[href="/' + path.join('/') + '"].nav-link'
console.log $activeNavLinks
$activeNavLinks.parent().addClass 'active'

# This fixes a Sitefinity issue where empty divs get a free non-breaking space.
$('div').each ->
  $(this).html( $(this).html().replace(/&nbsp;/gi,'') )

# popover activation
$('.account-popover').popover
  html: true
  content: ->
    return $ '#popover'
      .clone()
      .attr 'hidden', false
  placement: 'bottom'
  constraints: [
    to: 'window'
    pin: true
  ]

# $('.account-popover').on 'click', ( e ) ->
