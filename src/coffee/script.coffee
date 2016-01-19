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

  # promo = $.ajax
  #   url: '//afaa.nasm.pw/promo.html'
  #   method: 'GET'
  #
  # promo.done ( data ) ->
  #   $spacer = $ '.mobile-nav-spacer'
  #   $promoBar = $ data
  #   $promoBar.insertAfter $spacer
  #   setTimeout ->
  #     $promoBar.find('.navbar-message').addClass 'activated'
  #   , 1000
  #   return null
