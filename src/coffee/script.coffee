jQuery ( $ ) ->
  console.log 'script loaded'

  # Activate active nav links
  path = location.pathname.split("/")
  path.shift()
  $activeNavLinks = $ 'a[href="/' + path.join('/') + '"].nav-link'
  # console.log $activeNavLinks
  $activeNavLinks.parent().addClass 'active'

  # This fixes a Sitefinity issue where empty divs get a free non-breaking space.
  $('div').each ->
    $(this).html( $(this).html().replace(/&nbsp;/gi,'') )
  # Free breaks too, remove em!
  $('br').remove();

  # popover activation
  $('.account-popover').popover
    html: true
    content: ->
      return $ '#popover'
        .clone()
        .show()
    placement: 'bottom'
    constraints: [
      to: 'window'
      pin: true
    ]

  # $('.account-popover').on 'click', ( e ) ->

  # URL Hax
  linx = $ 'a'
  linx.each ->
    href = $(this).attr 'href'
    if href
      $(this).attr 'href', href.replace( 'shop.nasm.org', 'stg-shop.nasm.org' )
