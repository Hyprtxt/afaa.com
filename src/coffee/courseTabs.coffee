jQuery ( $ ) ->
  $tabLinks = $ '.nav-tabs li a'
  $tabContent = $ '.tab-content > div'

  $tabLinks.on 'click', ( e ) ->
    $this = $ this
    active = $this.attr 'href'
      .replace '#', ''
    e.preventDefault()
    $tabLinks.removeClass 'active'
    $this.addClass 'active'
    $tabContent.each ( ) ->
      $this = $ this
      if active is 'everything'
        $this.fadeIn 500
      else
        if $this.attr( 'id' ) is active
          $this.delay 501
            .fadeIn 500
        else
          $this.fadeOut 500
