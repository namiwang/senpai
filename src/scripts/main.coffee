$$ = (selector) -> document.querySelector(selector)

Senpai = window.Senpai =
  init: ->
    @$ =
      screens: $$ '#screens'

    await @_load_resources()
    console.log 'resources_loaded'

    @$.screens.select 'opening'

  _load_resources: ->
    console.log '_load_resources'

    @story = 
      characters: await (await fetch '../resources/story/characters.json').json()
      script: await (await fetch '../resources/story/scripts/main.json').json()

Senpai.init()
