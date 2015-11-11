module.exports =
  title: 'AFAA'
  javascripts: [
    '/js/jquery/jquery.min.js'
    '/js/bootstrap/util.js'
    '/js/bootstrap/collapse.js'
    '/js/bootstrap/dropdown.js'
    '/js/script.js'
  ]
  stylesheets: [
    '/css/font-awesome/font-awesome.min.css'
    '/css/style.css'
  ]
  phone: '1 (800) 555-5555'
  navbarBrand:
    title: 'AFAA'
    link: '/'
  topNavigation: [
    title: 'Sign In'
    link: '#'
    icon: 'fa-user'
  ,
    title: 'Cart'
    link: '#'
    icon: 'fa-shopping-cart'
  ,
    title: '1 (800) 555-5555'
    link: '#'
    icon: 'fa-phone'
  ]
  navigation: [
    title: 'Group Fitness'
    link: '#'
  ,
    title: 'Personal Trainer'
    link: '#'
  ,
    title: 'Continuing Education'
    link: '#'
  ,
    title: 'Workshops'
    link: '#'
  ,
    title: 'Recertification'
    link: '#'
  ]
  timestamp: new Date()
  env: process.env.NODE_ENV
