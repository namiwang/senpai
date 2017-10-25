class SenpaiApp extends SenpaiBase
  ready: ->
    super()

Object.defineProperty SenpaiApp, 'is',
  get: -> 'senpai-app'

Object.defineProperty SenpaiApp, 'properties',
  get: ->
    {
      prop1: {
        type: String
        value: 'senpai-app'
      }
    }

window.customElements.define SenpaiApp.is, SenpaiApp
