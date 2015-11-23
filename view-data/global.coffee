module.exports =
  assets: '/Sitefinity/WebsiteTemplates/AFAA/App_Themes/AFAA_Theme/assets',
  title: 'AFAA'
  description: 'AFAA Static'
  javascripts: [
    '/js/jquery/jquery.min.js'
    '/js/bootstrap/util.js'
    '/js/bootstrap/collapse.js'
    '/js/bootstrap/dropdown.js'
    '/js/script.js'
  ]
  stylesheets: [
    '//fonts.googleapis.com/css?family=Open+Sans:400,400italic,700|Roboto+Condensed:400,700'
    '/css/style.css'
  ]
  phone: '1 (800) 555-5555'
  navbarBrand:
    title: 'AFAA'
    link: '/'
  topNavigation: [
    title: 'Cart'
    link: '#'
    class: [ 'b-r', 'p-r' ]
    # icon: 'fa-shopping-cart'
  ,
    title: 'My Account'
    link: '#'
    # icon: 'fa-user'
  ]
  navigation: [
    title: 'Group X Instructor'
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
