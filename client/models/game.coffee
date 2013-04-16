class Game
  constructor: ->
    @fps = 30
    @canvasElement = $("<canvas>")
    @canvas = undefined

  buildCanvas: (elementAppendSel, width, height) ->
    @canvasElement.attr "width", width
    @canvasElement.attr "height", height
    @canvas = @canvasElement.get(0).getContext("2d")
    @canvasElement.appendTo(elementAppendSel)

  start: ->
    setInterval =>
      @process()
      @draw()
    , 1000 / @fps

  process: ->
    console.log "processing" 

  draw: ->
    console.log "drawing"







