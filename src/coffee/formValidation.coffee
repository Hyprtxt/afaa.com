jQuery ( $ ) ->

  # Hack to fix sitefinity spacing on the HP
  if $('.mobile-nav-spacer')[1]
    $('.mobile-nav-spacer')[1].remove()

  $form = $ '#acton1'

  $form.formValidation
    framework: 'bootstrap'
    icon:
      valid: 'fa fa-check'
      invalid: 'fa fa-remove'
      validating: 'fa fa-refresh'
    fields:
      'First Name':
        row: '.col-sm-6'
        validators:
          notEmpty:
            message: 'Your name is required'
          stringLength:
            min: 2
            max: 36
            message: 'Name should be more than 2 and less than 36 characters long'
          regexp:
            regexp: /^[a-zA-Z. ]+$/
            message: 'Name can only consist of alphabetical characters and "."'
      'Last Name':
        validators:
          notEmpty:
            message: 'Your name is required'
          stringLength:
            min: 2
            max: 36
            message: 'Name should be more than 2 and less than 36 characters long'
          regexp:
            regexp: /^[a-zA-Z. ]+$/
            message: 'Name can only consist of alphabetical characters and "."'
      'Email Address':
        validators:
          notEmpty:
            message: 'Your email address is required'
          emailAddress:
            message: 'That does not look like a valid email address'
          stringLength:
            max: 80
            message: 'Email must not be more than 80 characters long'
      'Phone':
        validators:
          notEmpty:
            message: 'Your phone number is required'
          phone:
            country: 'US'
            message: 'Use this format: 555-555-5555'
          stringLength:
            max: 25
            message: 'Phone # must not be more than 25 characters long'

  validator = $form.data 'formValidation'

  $thanks = $ '#thanks'

  $form.on 'submit', ( e ) ->
    e.preventDefault()
    if validator.isValid()
      $.ajax
        type: 'POST'
        url: $form.attr 'action'
        data: $form.serialize()
      .always ( ) ->
        $thanks.modal()
