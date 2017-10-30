class SenpaiOpeningScreen extends window.SenpaiBase
  ready: ->
    super()

Object.defineProperty SenpaiOpeningScreen, 'is',
  get: -> 'senpai-opening-screen'

window.customElements.define SenpaiOpeningScreen.is, SenpaiOpeningScreen
