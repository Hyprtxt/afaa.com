jQuery ( $ ) ->
  $spinner = $('<span>').addClass( 'fa fa-cog fa-spin')

  $('.account-popover').on 'shown.bs.popover', ->
    $('.popover a').on 'click', ( e ) ->
      $( '.account-popover' ).html $spinner

  $('.btn').on 'click', ( e ) ->
    $this = $ this
    $this.html $spinner
