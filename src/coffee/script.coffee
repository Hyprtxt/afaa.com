console.log 'script loaded'

# $unbreaker = $ '.unbreaker'
# $unbreaker.remove()

# jQuery ( $ ) ->
# $activeNavLinks = $ 'a[href^="/' + location.pathname.split("/")[1] + '"].nav-link'
$activeNavLinks = $ 'a[href="/' + location.pathname.split("/")[1] + '"].nav-link'
console.log $activeNavLinks
$activeNavLinks.parent().addClass 'active'

$('div').each ->
  $(this).html( $(this).html().replace(/&nbsp;/gi,'') )

$('.product-thumb').on 'click', ( e ) ->
  $this = $ this
  $ 'img.active'
    .removeClass 'active'
  $ '.product-image'
    .attr 'src', $this.attr('src')
  $this.addClass 'active'
