class SenpaiOpeningScreen extends window.SenpaiBase
  ready: ->
    super()

  _handle_start_btn_click: (e) ->
    @dispatchEvent new CustomEvent('start-btn-clicked')

Object.defineProperty SenpaiOpeningScreen, 'is',
  get: -> 'senpai-opening-screen'

window.customElements.define SenpaiOpeningScreen.is, SenpaiOpeningScreen
