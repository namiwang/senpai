# TODO
# gulp plugins loader
# watch
# lint

# WATCH
# 
# *.coffee (for gulpfile.coffee) and src/**/*.coffee
# coffee -cwb *.coffee src
# 
# sass
# sass --watch src:src
# 

$ = require 'gulp'

gulpif = require 'gulp-if'
# coffeescript = require 'gulp-coffeescript'
# sass = require 'gulp-sass'
style_inject = require 'gulp-style-inject'

PolymerProject = require('polymer-build').PolymerProject
project = new PolymerProject(require('./polymer.json'))

$.task 'build', ->
  sourcesStream = project.sources()
    # .pipe gulpif(/\.coffee$/, coffeescript({bare: true}))
    # .pipe gulpif(/\.sass$/, sass())
    .pipe gulpif(/\.html$/, style_inject( { path: 'src/components/' } ))
    .pipe $.dest('build')

  project.dependencies()
    .pipe $.dest('build')
