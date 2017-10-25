class SenpaiApp extends SenpaiBase
  ready: ->
    super()

Object.defineProperty SenpaiApp, 'is',
  get: -> 'senpai-app'

Object.defineProperty SenpaiApp, 'properties',
  get: ->
    {}

window.customElements.define SenpaiApp.is, SenpaiApp
