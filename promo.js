jQuery( function( $ ) {
  promo = $.ajax({
    url: '//afaa.nasm.pw/promo.html',
    method: 'GET'
  });
  promo.done(function(data) {
    var $promoBar, $spacer;
    $spacer = $('.mobile-nav-spacer');
    $promoBar = $( data )
    $promoBar.insertAfter( $spacer );
    setTimeout(function() {
      $('.navbar-message').addClass('activated');
      $('.navbar-message').on('click', function(e) {
        $('#offer').modal();
      });
    }, 1000);
  });
  promo.error(function(err) {
    return console.log(err);
  });
});
