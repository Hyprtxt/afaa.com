# Adds button animated cog effects to indicate that a page is loading.

jQuery ( $ ) ->
  $spinner = $('<span class="fa fa-cog fa-spin"></span>')

  $('.account-popover').on 'shown.bs.popover', ->
    $('.popover a').on 'click', ( e ) ->
      $( '.account-popover' ).html $spinner

  $('.btn').on 'click', ( e ) ->
    $this = $ this
    $this.html $spinner
