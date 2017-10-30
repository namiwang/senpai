$$ = (selector) -> document.querySelector(selector)

Senpai = window.Senpai =
  init: ->
    @$ =
      screens: $$ '#screens'
      opening_screen: $$ 'senpai-opening-screen'

    await @_load_resources()
    console.log 'resources_loaded'

    @_show_opening_screen()

  _load_resources: ->
    console.log '_load_resources'

    # TODO
    # @resources
    @story = 
      characters: await (await fetch '../resources/story/characters.json').json()
      script: await (await fetch '../resources/story/scripts/main.json').json()

  _show_opening_screen: ->
    # init opening screen, bind event
    @$.opening_screen.addEventListener 'start-btn-clicked', (e) => @_story_start()
    @$.screens.select 'opening'

  # 
  # story
  # 

  _story_start: ->
    @_story_render_node @story.script[0]

  _story_render_node: (node) ->
    debugger

Senpai.init()
