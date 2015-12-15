jQuery ( $ ) ->
  $tabLinks = $ '.nav-tabs li a'
  $tabContent = $ '.tab-content > div'
  hash = window.location.hash

  # $( window ).on 'popstate', ( e ) ->
  #   console.log e
  #   loadTab hash.replace( '#', '' ), $( "a[href='" + hash + "_hash']" )

  $tabLinks.on 'click', ( e ) ->
    $this = $ this
    active = $this.attr 'href'
      .replace '#', ''
      .replace '_hash', ''
    # console.log active
    e.preventDefault()
    loadTab active, $this

  loadTab = ( active, $element ) ->
    console.log 'loadTab', active, $element
    # history.pushState {}, '', '#' + active
    $tabLinks.removeClass 'active'
    $element .addClass 'active'
    $tabContent.each ->
      $this = $ this
      $this.fadeOut 500
      setTimeout ->
        if active is 'everything'
          $this.fadeIn 500
        else
          if $this.attr( 'id' ) is active + '_hash'
            $this.fadeIn 500
      , 500
    return

  if hash
    loadTab hash.replace( '#', '' ), $( "a[href='" + hash + "_hash']" )
  else
    window.location.hash = 'everything'

  rem_width = $( window ).width() / parseFloat( $( "body" ).css( "font-size" ) )
  if rem_width < 62
    $ '.course-filters'
      .removeClass 'nav-tabs'
      .addClass 'nav-pills nav-stacked'
