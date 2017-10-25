# TODO
# gulp plugins loader
# watch
# lint

# WATCH
# 
# *.coffee (for gulpfile.coffee) and src/**/*.coffee
# coffee -cwb *.coffee src
# 
# NOTE
# we're not using gulp-coffeescript, since, there's no support for coffee2
# 

$ = require 'gulp'

gulp_if = require 'gulp-if'
sass = require 'gulp-sass'
haml = require 'gulp-ruby-haml'
style_inject = require 'gulp-style-inject'

PolymerProject = require('polymer-build').PolymerProject
project = new PolymerProject(require('./polymer.json'))

$.task 'watch', ->
  $.watch ['src/**/*.haml', 'src/**/*.sass'], ->
    $
      .src ['src/**/*.haml'], { base: '.' }
      .pipe haml()
      .pipe $.dest './'

    $
      .src ['src/**/*.sass'], { base: '.' }
      .pipe sass()
      .pipe $.dest './'

  $.start 'build'

$.task 'build', ->
  sourcesStream = project.sources()
    .pipe gulp_if(/\.html$/, style_inject( { path: 'src/components/' } ))
    .pipe $.dest('build')

  project.dependencies()
    .pipe $.dest('build')
