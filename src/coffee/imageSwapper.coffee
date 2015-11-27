$('.product-thumb').on 'click', ( e ) ->
  $this = $ this
  $ 'img.active'
    .removeClass 'active'
  $ '.product-image'
    .attr 'src', $this.attr('src')
  $this.addClass 'active'
