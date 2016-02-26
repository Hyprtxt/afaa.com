jQuery ->
  linkfixer = (i, v) ->
    $link = $(v)
    linkText = $link.attr( 'href' )
    if linkText != undefined
      if linkText.indexOf( 'shop.nasm.org' )
        # console.log( linkText );
        $link.attr 'href', linkText.replace( 'shop.nasm', 'm.nasm' )
    return null
  if $(window).width() < 768
    # console.log( 'mobile' );
    $( '.content a' ).each linkfixer
    $( '.recert ul li a' ).each linkfixer
  $( '.recert ul li a' ).css( 'text-decoration', 'underline' )
  return null
