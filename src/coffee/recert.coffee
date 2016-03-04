# Recertification Wizard
# Templates: recert.jade

miniCart = {
  "9241": 0
  "9272": 0
  "9273": 0
  "9239": 0
  "9274": 0
}

jQuery ( $ ) ->
  $window = $ window

  ready = false

  forLife = 'false'

  $addButton = $ '#addToCart'
  $loopButton = $ '#loopButton'

  $q1 = $ '.list1'
  $q2 = $ '.list2'
  $q3 = $ '.list3'
  $q4 = $ '.list4'

  $items = $ '.recert-items'
  $total = $ '.total'

  $f1 = $ '#field1'
  $f2 = $ 'input[name=forLife]'
  $f3 = $ 'input[name=expired]'
  $f4 = $ 'input[name=petition]'

  $results = $ '.recert-results'

  $once = $ '.recert-once'
  $lifePFT = $ '.recert-life-pft'
  $lifeGroup = $ '.recert-life-group'
  $late = $ '.late'
  $petition = $ '.petition'

  initialHide = ->
    $total.text '0'
    $q2.hide()
    $q3.hide()
    $q4.hide()
    $once.hide()
    $lifePFT.hide()
    $lifeGroup.hide()
    $late.hide()
    $petition.hide()
    $addButton.hide()
    $loopButton.hide()
    $f1.prop 'selectedIndex', 0
    $f2.attr 'checked', false
    $f3.attr 'checked', false
    $f4.attr 'checked', false
    return

  saveToMiniCart = ->
    $visible = $items.find 'li:visible'
    $visible.each ( idx, element ) ->
      sku = $( element ).data 'sku'
      miniCart[sku] = miniCart[sku] + 1
      return
    return

  initialHide()

  $f1.on 'change', ( e ) ->
    $q2.hide()
    # console.log e.target.value, '1'
    if e.target.value is ''
      initialHide()
    else if e.target.value is 'group-ex'
      forLife = 'group-ex'
      $q2.show()
    else if e.target.value is 'pft'
      forLife = 'pft'
      $q2.show()
    else
      $q3.show()
    $lifePFT.hide()
    $lifeGroup.hide()
    $f2.attr 'checked', false
    $once.show()
    $window.trigger 'recalc'
    return

  $f2.on 'change', ( e ) ->
    # console.log e.target
    # console.log e.target.value, typeof( e.target.value )
    $q3.show()
    if e.target.value is 'true'
      # console.log '2 is true'
      if forLife is 'group-ex'
        $lifeGroup.show()
      if forLife is 'pft'
        $lifePFT.show()
      $once.hide()
      # $f3.attr 'checked', false
    else
      # console.log '2 is false'
      $lifeGroup.hide()
      $lifePFT.hide()
      # $f2.attr 'checked', false
      $once.show()
    $window.trigger 'recalc'
    return

  $f3.on 'change', ( e ) ->
    # console.log e.target.value, '3'
    $q4.show()
    if e.target.value is 'true'
      $late.show()
    else
      $late.hide()
      # $f3.attr 'checked', false
    $window.trigger 'recalc'
    return

  $f4.on 'change', ( e ) ->
    $addButton.show()
    $loopButton.show()
    # console.log e.target.value, '4'
    if e.target.value is 'true'
      $petition.show()
    else
      $petition.hide()
      # $f4.attr 'checked', false
    $window.trigger 'recalc'
    return

  $addButton.on 'click', ( e ) ->
    url = 'https://shop.nasm.org/addtocart.aspx?'
    saveToMiniCart()
    console.log miniCart
    for qty, sku of miniCart
      console.log qty, sku
    # miniCart.each ( sku ) ->
    #   console.log sku
    #
    # # $visible = $items.find 'li:visible'
    # # $visible.each ( idx, element ) ->
    # #   sku = $( element ).data 'sku'
    #   if idx isnt 0
    #     url = url + '&'
    #   url = url + 'upsellproducts=' + sku
    # console.log url
    # window.location = url;
    return

  $loopButton.on 'click', ( e ) ->
    saveToMiniCart()
    initialHide()
    return

  $window.on 'recalc', ( e ) ->
    price = 0
    # console.log 'custom event'
    $visible = $items.find 'li:visible'
    $visible.each ( idx, element ) ->
       price = price + $( element ).data 'price'
       return
    $total.text price
    return

  return
