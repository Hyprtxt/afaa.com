# console.log 'goooo'

# ?course=&expired=false&petition=false


# https://shop.nasm.org/addtocart.aspx?productid=9239
# https://shop.nasm.org/addtocart.aspx?productid=9241
# https://shop.nasm.org/addtocart.aspx?productid=9274
# https://shop.nasm.org/addtocart.aspx?productid=9272
# https://shop.nasm.org/addtocart.aspx?productid=9273

getQueryString = ->
  vars = []
  # Get the start index of the query string
  qsi = window.location.href.indexOf("?")
  return vars if qsi is -1
  # Get the query string
  qs = window.location.href.slice(qsi + 1)
  # Check if there is a subsection reference
  sri = qs.indexOf("#")
  qs = qs.slice(0, sri) if sri >= 0
  # Build the associative array
  hashes = qs.split("&")
  for hash in hashes
    sep = hash.indexOf("=")
    continue if sep <= 0
    key = decodeURIComponent(hash.slice(0, sep))
    val = decodeURIComponent(hash.slice(sep + 1))
    vars[key] = val
  return vars

jQuery ( $ ) ->
  $window = $ window

  ready = false

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
  $life = $ '.recert-life'
  $late = $ '.late'
  $petition = $ '.petition'

  qs = getQueryString()
  # if qs.length
    # Have query string!!!

  # clear fields before re-showing

  initialHide = ->
    $q2.hide()
    $q3.hide()
    $q4.hide()
    $once.hide()
    $life.hide()
    $late.hide()
    $petition.hide()
    $f2.attr 'checked', false
    $f3.attr 'checked', false
    $f4.attr 'checked', false
    return

  initialHide()

  $f1.on 'change', ( e ) ->
    $q2.hide()
    console.log e.target.value, '1'
    if e.target.value is ''
      initialHide()
    else if e.target.value is 'group-ex'
      $q2.show()
    else if e.target.value is 'pft'
      $q2.show()
    else
      $q3.show()
    $life.hide()
    $f2.attr 'checked', false
    $once.show()
    $window.trigger 'recalc'
    return

  $f2.on 'change', ( e ) ->
    # console.log e.target
    console.log e.target.value, typeof( e.target.value )
    $q3.show()
    if e.target.value is 'true'
      console.log '2 is true'
      $life.show()
      $once.hide()
      # $f3.attr 'checked', false
    else
      console.log '2 is false'
      $life.hide()
      # $f2.attr 'checked', false
      $once.show()
    $window.trigger 'recalc'
    return

  $f3.on 'change', ( e ) ->
    console.log e.target.value, '3'
    $q4.show()
    if e.target.value is 'true'
      $late.show()
    else
      $late.hide()
      # $f3.attr 'checked', false
    $window.trigger 'recalc'
    return

  $f4.on 'change', ( e ) ->
    console.log e.target.value, '4'
    if e.target.value is 'true'
      $petition.show()
    else
      $petition.hide()
      # $f4.attr 'checked', false
    $window.trigger 'recalc'
    return

  $window.on 'recalc', ( e ) ->
    price = 0
    console.log 'custom event'
    $visible = $items.find 'li:visible'
    $visible.each ( idx, element ) ->
       price = price + $( element ).data 'price'
       return
    $total.text price
    return

  return


  # $test = $ '#test'
  # $test.on 'click', ( e ) ->
  #   e.preventDefault()
  #   $.ajax( 'https://shop.nasm.org/addtocart.aspx?productid=9239' ).done ( data, textStatus ) ->
  #     console.log textStatus
  #     return
  #   return
