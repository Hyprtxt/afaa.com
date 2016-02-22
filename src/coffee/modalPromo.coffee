jQuery ( $ ) ->
  $offerBtn = $ '.offer-button'
  $offer = $ '#offer'
  # offerPage = '/'
  $offerBtn.on 'click', ( e ) ->
    e.preventDefault()
    $offer.modal()
    return
  return



  # $offer = $ '#offer'
  # $message = $ '.navbar-message'
  # $message.on 'click', ( e ) ->
  #   e.preventDefault()
  #   $offer.modal()
  #   return null
