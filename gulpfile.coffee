# TODO
# gulp plugins loader
# haml: rescure error
# watch
# lint, analyze
# cleanup

# WATCH
# 
# *.coffee (for gulpfile.coffee) and src/**/*.coffee
# coffee -cwb *.coffee src
# 
# NOTE
# we're not using gulp-coffeescript, since, there's no support for coffee2
# 

# 
# NOTE
# 
# so current build steps:
# 
# 1. coffee -cwb *.coffee src
# 2. gulp watch
# 3. http-server
# 

$ = require 'gulp'

gulp_if = require 'gulp-if'
sass = require 'gulp-sass'
haml = require 'gulp-ruby-haml'
style_inject = require 'gulp-style-inject'

PolymerProject = require('polymer-build').PolymerProject
project = new PolymerProject(require('./polymer.json'))

$.task 'compile', ->
  $
    .src ['src/**/*.haml'], { base: '.' }
    .pipe haml()
    .pipe $.dest './'

  $
    .src ['src/**/*.sass'], { base: '.' }
    .pipe sass()
    .pipe $.dest './'

$.task 'watch', ->
  $.start 'compile'

  $.watch ['src/**/*.haml', 'src/**/*.sass'], ->
    $.start 'compile'

  $.start 'build'

$.task 'build', ->
  # TODO make this async (run-sequence i guess)
  $.start 'compile'

  # TODO clean

  is_component_html = (file) -> /^.*src\/components\/.*\.html$/.test file.path

  sourcesStream = project.sources()
    # TODO only inject components
    .pipe gulp_if(is_component_html, style_inject( { path: 'src/components/' } ))
    .pipe $.dest('build')

  project.dependencies()
    .pipe $.dest('build')
