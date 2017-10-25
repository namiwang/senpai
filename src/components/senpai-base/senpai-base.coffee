class SenpaiBase extends Polymer.Element
  ready: ->
    console.info "#{@nodeName}: ready"

    super()

Object.defineProperty SenpaiBase, 'is',
  get: -> 'senpai-base'

window.customElements.define SenpaiBase.is, SenpaiBase
