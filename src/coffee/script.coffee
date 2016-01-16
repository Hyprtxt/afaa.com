jQuery ( $ ) ->

  # Activate active nav links
  path = location.pathname.split("/")
  path.shift()
  $activeNavLinks = $ 'a[href="/' + path.join('/') + '"].nav-link'
  $activeNavLinks.parent().addClass 'active'

  # This fixes a Sitefinity issue where empty divs get a free non-breaking space.
  $('div').each ->
    $(this).html( $(this).html().replace(/&nbsp;/gi,'') )

  # SF adds breaks too, remove em!
  $('br').remove()

  # Sitefinity hates pointers on links...
  $('a').each ->
    $(this).attr('style', '')

  # popover activation
  $('.account-popover').popover
    html: true
    content: ->
      return $ '#popover'
        .clone()
        .show()
    placement: 'bottom'
    trigger: 'focus'
    constraints: [
      to: 'window'
      pin: true
    ]
  setTimeout ->
    document.getElementsByClassName('navbar-message')[0].className = 'navbar navbar-message bg-faded activated'
  , 1000
