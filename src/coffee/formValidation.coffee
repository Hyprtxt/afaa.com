jQuery ( $ ) ->
  console.log 'have valid'

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
            message: 'That does not look like a valid phone number'
          stringLength:
            max: 25
            message: 'Phone # must not be more than 25 characters long'
