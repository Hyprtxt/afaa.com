gulp = require 'gulp'
gutil = require 'gulp-util'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
autoprefixer = require 'gulp-autoprefixer'
coffee = require 'gulp-coffee'
livereload = require 'gulp-livereload'
rimraf = require 'rimraf'
list = require 'gulp-task-listing'
exec = require('child_process').exec

gulp.task 'default', list

gulp.task 'help', list

gulp.task 'clean', ( cb ) ->
  return rimraf './static_generated', cb

gulp.task 'sass', ->
  return gulp.src './src/sass/**/*.sass'
    .pipe sourcemaps.init()
    .pipe sass(
        outputStyle: 'expanded'
        includePaths: [ './bower_components/' ]
      ).on 'error', sass.logError
    .pipe autoprefixer ['> 1%']
    .pipe sourcemaps.write '../map' # , sourceRoot: __dirname + './src'
    .pipe gulp.dest './static_generated/css'
    .pipe livereload()

gulp.task 'copyjs', ->
  gulp.src './bower_components/bootstrap/js/dist/*'
    .pipe gulp.dest './static_generated/js/bootstrap'
  return gulp.src './bower_components/jquery/dist/*'
    .pipe gulp.dest './static_generated/js/jquery'

gulp.task 'copycss', ->
  return

gulp.task 'copyfont', ->
  return gulp.src './bower_components/font-awesome/fonts/*'
    .pipe gulp.dest './static_generated/fonts'

gulp.task 'coffee', ->
  return gulp.src './src/coffee/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee(
        bare: true
      ).on 'error', gutil.log
    .pipe sourcemaps.write '../map' # , sourceRoot: __dirname + './src'
    .pipe gulp.dest './static_generated/js'
    .pipe livereload()

gulp.task 'reload', ->
  return livereload.reload()

gulp.task 'watch', [ 'copyfont', 'copycss', 'sass', 'copyjs', 'coffee' ], ->
  gulp.watch './src/sass/**/*.sass', ['sass']
  gulp.watch './src/coffee/**/*.coffee', ['coffee']
  gulp.watch './views/**/*.jade', ['reload']
  gulp.watch './static/**/*.*', ['reload']
  gulp.watch './readme.md', ['reload']
  return livereload.listen
    basePath: './src'
    start: true

# static site stuff

jade = require 'gulp-jade'
gulp.task 'jade', [ 'cleanstatic' ], ->
  return gulp.src [ './views/**/*.jade', '!./views/layout/**' ]
    .pipe jade
      locals: require './view-data/global'
      pretty: true
    .pipe gulp.dest './public_html'

gulp.task 'copystatic', [ 'jade', 'copyfont', 'copycss', 'sass', 'copyjs', 'coffee' ], ->
  return gulp.src [ './static/**', './static_generated/**' ]
    .pipe gulp.dest './public_html'

gulp.task 'cleanstatic', ( cb ) ->
  return rimraf './public_html', cb

gulp.task 'cleanmap', [ 'copystatic' ], ( cb ) ->
  return rimraf './public_html/map', cb

gulp.task 'render', [ 'cleanstatic', 'copystatic', 'cleanmap' ], ->
  return
