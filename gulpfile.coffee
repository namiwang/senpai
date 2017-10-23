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
coffeescript = require 'gulp-coffeescript'
sass = require 'gulp-sass'

PolymerProject = require('polymer-build').PolymerProject
project = new PolymerProject(require('./polymer.json'))

$.task 'build', ->
  sourcesStream = project.sources()
    .pipe gulpif(/\.coffee$/, coffeescript({bare: true}))
    .pipe gulpif(/\.sass$/, sass())
    .pipe $.dest('build/')

