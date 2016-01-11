jQuery ->
  if $(window).width() < 768
    # console.log( 'mobile' );
    $( '.content a' ).each (i, v) ->
      $link = $(v)
      linkText = $link.attr( 'href' )
      if linkText != undefined
        if linkText.indexOf( 'shop.nasm.org' )
          # console.log( linkText );
          $link.attr 'href', linkText.replace( 'shop.nasm', 'm.nasm' )
      return null
