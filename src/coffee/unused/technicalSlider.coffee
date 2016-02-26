jQuery ( $ ) ->
  console.log 'things'
  $closer = $ '.technicalRequirements .closer'
  $content = $ '.technicalRequirements .content'
  $closer.on 'click', ( e ) ->
    e.preventDefault()
    $content.slideToggle 500
    $closer.find '.fa'
      .toggleClass 'fa-rotate-270'
