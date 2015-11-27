console.log 'script loaded'

path = location.pathname.split("/")
path.shift()
$activeNavLinks = $ 'a[href="/' + path.join('/') + '"].nav-link'
console.log $activeNavLinks
$activeNavLinks.parent().addClass 'active'

$('div').each ->
  $(this).html( $(this).html().replace(/&nbsp;/gi,'') )
