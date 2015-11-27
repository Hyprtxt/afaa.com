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

gulp.task 'default', [ 'clean' ], ->
  gulp.start 'watch'

gulp.task 'help', list

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
  gulp.src './bower_components/bootstrap/js/dist/*'
    .pipe gulp.dest dest + '/js/bootstrap'
  return gulp.src './bower_components/jquery/dist/*'
    .pipe gulp.dest dest + '/js/jquery'

gulp.task 'copycss', ->
  return gulp.src './bower_components/font-awesome/css/*'
    .pipe gulp.dest dest + '/css/font-awesome'

gulp.task 'copyfont', ->
  return gulp.src './bower_components/font-awesome/fonts/*'
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
  gulp.watch 'views/*.jade', ['jadeSingle']
  gulp.watch 'views/block/*.jade', ['jade']
  gulp.watch 'views/layout/**/*.jade', ['jade']
  gulp.watch 'view-data/**/*.coffee', ['jade']
  gulp.watch 'markdown/**/*.md', ['jade']
  gulp.watch 'readme.md', ['jade']
  return livereload.listen
    basePath: 'static_generated/'
    start: true

# static site stuff
getObject = ( path, next ) ->
  fs.readFile path, 'utf8', ( err, _data ) ->
    if err
      throw err
    else
      coffeeopts =
        bare: true
        header: false
      next( eval coffeeScript.compile _data, coffeeopts )
    # return next()

_jadeData = {}
gulp.task 'setupJadeData', ( next ) ->
  getObject './view-data/global.coffee', ( obj ) ->
    _jadeData = obj
    return next()

_jadeSrc = [
  './views/**/*.jade'
  '!./views/layout/**'
  '!./views/block/**'
  '!./views/template/**'
]

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

gulp.task 'products', [ 'setupJadeData' ], ->
  products = glob.sync './view-data/products/**.coffee'
  jadeData = _jadeData
  jadeData.javascripts.push '/js/imageSwapper.js'
  tasks = products.map ( path, idx ) ->
    name = path.replace( './view-data/', '' ).replace( '.coffee', '.html' )
    # console.log name
    return gulp.src './views/template/products.jade'
      .pipe data ( file, next ) ->
        getObject path, ( data ) ->
          jadeData.product = data
          next undefined, jadeData
      .pipe jade
        pretty: true
      .pipe rename name
      .pipe gulp.dest dest
  return merge tasks

gulp.task 'copystatic', ->
  gulp.src [ './static/**', dest + '/**' ]
    .pipe gulp.dest dest

gulp.task 'render', [ 'products', 'copystatic', 'jade', 'copyfont', 'copycss', 'sass', 'copyjs', 'coffee' ]
# , ( cb ) ->
  # rimraf dest + '/map', cb

gulp.task 'build', [ 'clean' ], ->
  gulp.start 'render'
