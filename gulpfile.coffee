#!/usr/bin/env coffee

# It crashes when you eff up the jade templates. Helpful but barfy.

gulp = require 'gulp'
changed = require 'gulp-changed'
wait = require 'gulp-wait'
gutil = require 'gulp-util'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
autoprefixer = require 'gulp-autoprefixer'
coffee = require 'gulp-coffee'
livereload = require 'gulp-livereload'
rimraf = require 'rimraf'
list = require 'gulp-task-listing'
glob = require 'glob'
q = require 'q'
rename = require 'gulp-rename'
jade = require 'gulp-jade'
fs = require 'fs'
coffeeScript = require 'coffee-script'
merge = require 'merge-stream'
data = require 'gulp-data'

dest = './static_generated'

_jadeData = {}
gulp.task 'setupJadeData', ( next ) ->
  requireCoffee './view-data/global.coffee', ( obj ) ->
    _jadeData = obj
    return next()

_jadeSrc = [
  './views/**/*.jade'
  '!./views/layout/**'
  '!./views/block/**'
  '!./views/template/**'
  '!./views/courses.jade'
]

gulp.task 'default', [ 'clean' ], ->
  gulp.start 'watch'

gulp.task 'help', list
gulp.task 'list', list

gulp.task 'clean', ( cb ) ->
  return rimraf dest, cb

gulp.task 'sass', ->
  return gulp.src './src/sass/**/*.sass'
    .pipe sourcemaps.init()
    .pipe sass(
        outputStyle: 'expanded'
        includePaths: [ './bower_components/' ]
      ).on 'error', sass.logError
    .pipe autoprefixer ['> 1%']
    .pipe sourcemaps.write '../map' # , sourceRoot: __dirname + './src'
    .pipe gulp.dest dest + '/css'
    .pipe livereload()

gulp.task 'copyjs', ->
  gulp.src './bower_components/tether/dist/js/**'
    .pipe gulp.dest dest + '/js/tether'
  gulp.src './bower_components/bootstrap/js/dist/**'
    .pipe gulp.dest dest + '/js/bootstrap'
  gulp.src './bower_components/jquery-cycle2/build/**'
    .pipe gulp.dest dest + '/js/jquery-cycle2'
  return gulp.src './bower_components/jquery/dist/**'
    .pipe gulp.dest dest + '/js/jquery'

gulp.task 'copycss', ->
  return gulp.src './bower_components/font-awesome/css/**'
    .pipe gulp.dest dest + '/css/font-awesome'

gulp.task 'copyfont', ->
  return gulp.src './bower_components/font-awesome/fonts/**'
    .pipe gulp.dest dest + '/fonts'

gulp.task 'coffee', ->
  return gulp.src './src/coffee/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee(
        bare: true
      ).on 'error', gutil.log
    .pipe sourcemaps.write '../map' # , sourceRoot: __dirname + './src'
    .pipe gulp.dest dest + '/js'
    .pipe livereload()

gulp.task 'reload', ->
  return livereload.reload()

gulp.task 'watch', [ 'render' ], ->
  gulp.watch 'static/**/*.*', ['reload']
  gulp.watch 'src/sass/**/*.sass', ['sass']
  gulp.watch 'src/coffee/**/*.coffee', ['coffee']
  gulp.watch [
    'views/*.jade'
    '!views/courses.jade'
    ], ['jadeSingle']
  gulp.watch 'views/block/*.jade', ['jade']
  gulp.watch 'views/layout/**/*.jade', ['jade']
  # Products A.K.A Courses Does not live reload.
  gulp.watch 'view-data/*.coffee', ['jade', 'products']
  gulp.watch 'views/template/products.jade', ['products']
  gulp.watch 'views/courses.jade', ['courses']
  gulp.watch 'view-data/products/*.coffee', ['products']
  gulp.watch 'markdown/**/*.md', ['jade']
  gulp.watch 'readme.md', ['jade']
  return livereload.listen
    basePath: 'static_generated/'
    start: true

# static site stuff
requireCoffee = ( path, next ) ->
  fs.readFile path, 'utf8', ( err, _data ) ->
    if err
      throw err
    else
      coffeeopts =
        bare: true
        header: false
      next( eval coffeeScript.compile _data, coffeeopts )
    # return next()

doJade = ( stream ) ->
  return stream.pipe jade
    locals: _jadeData
    pretty: true
  .pipe gulp.dest dest
  .pipe wait 1000
  .pipe livereload()

gulp.task 'jade', [ 'setupJadeData' ], ( next ) ->
  stream = gulp.src _jadeSrc
  return doJade stream

gulp.task 'jadeSingle', [ 'setupJadeData' ], ( next ) ->
  stream = gulp.src _jadeSrc
    .pipe changed dest,
      extension: '.html'
  return doJade stream

modelsToJade = ( model ) ->
  models = glob.sync './view-data/' + model + '/**.coffee'
  jadeData = _jadeData
  # jadeData.javascripts.push '/js/imageSwapper.js' # Don't need it yet...
  tasks = models.map ( path, idx ) ->
    filename = path.replace( './view-data/products/', 'courses/' ).replace( '.coffee', '.html' )
    # console.log name
    return gulp.src './views/template/' + model + '.jade'
      .pipe data ( file, next ) ->
        requireCoffee path, ( data ) ->
          jadeData.product = data
          # jadeData.canonical = '/' + filename.replace '.html', ''
          next undefined, jadeData
      .pipe jade
        pretty: true
      .pipe rename filename
      .pipe gulp.dest dest
      .pipe wait 1000
      .pipe livereload()
  return merge tasks

gulp.task 'products', [ 'setupJadeData' ], ->
  return modelsToJade 'products'

gulp.task 'courses', [ 'setupJadeData' ], ->
  models = glob.sync './view-data/products/**.coffee'
  productData = models.map ( path, idx ) ->
    product = require path
    product.filename = path
      .replace './view-data/products/', ''
      .replace '.coffee', '.html'
    return product
  # console.log data
  eduData = _jadeData
  eduData.products = productData
  gulp.src './views/courses.jade'
    .pipe jade
      locals: eduData
      pretty: true
    .pipe gulp.dest dest
    .pipe wait 1000
    .pipe livereload()

gulp.task 'copystatic', ->
  gulp.src [ './static/**', dest + '/**' ]
    .pipe gulp.dest dest

gulp.task 'render', [
  'copystatic'
  'copyfont'
  'copycss'
  'sass'
  'copyjs'
  'coffee'
  'courses'
  'products'
  'jade'
]

gulp.task 'build', [ 'clean' ], ->
  gulp.start 'render'
