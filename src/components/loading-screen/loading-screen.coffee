class SenpaiLoadingScreen extends SenpaiBase
  ready: ->
    super()

Object.defineProperty SenpaiLoadingScreen, 'is',
  get: -> 'senpai-loading-screen'

window.customElements.define SenpaiLoadingScreen.is, SenpaiLoadingScreen
