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
    'https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700'
    'https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700'
    '/css/style.css'
  ]
  phone: '800-555-5555'
  navbarBrand:
    title: 'AFAA'
    link: '/'
  topNavigation: [
    title: 'Cart'
    link: 'https://shop.nasm.org/ShoppingCart.aspx'
    class: [ 'p-r' ]
  ,
    title: 'My Account'
    link: 'https://shop.nasm.org/account.aspx'
  ]
  navigation: [
    title: 'Group X Instructor'
    link: '/products/group-x'
  ,
    title: 'Personal Trainer'
    link: '/products/certified-personal-trainer-certification'
  ,
    title: 'Courses'
    link: '/courses'
  ,
    title: 'Workshops'
    link: '/workshops'
  ,
    title: 'Recertify'
    link: '/recertify'
  ]
  timestamp: new Date()
  env: process.env.NODE_ENV
