promo = $.ajax({
  url: '//afaa-prd-mkt01/ajax/promo-bar',
  method: 'GET'
});
promo.done(function(data) {
  var $promoBar, $spacer;
  $spacer = $('.mobile-nav-spacer');
  $promoBar = $(data).find('#PublicWrapper .sfContentBlock');
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
