class Game
  constructor: ->
    @fps = 30
    @canvasElement = $("<canvas>")
    @canvas = undefined
    @width = 0
    @height = 0

  buildCanvas: (elementAppendSel, width, height) ->
    @width = width
    @height = height

    @canvasElement.attr "width", width
    @canvasElement.attr "height", height
    @canvas = @canvasElement.get(0).getContext("2d")
    @canvasElement.appendTo(elementAppendSel)

  start: ->
    @player = new Player()  
    setInterval =>
      @process()
      @draw()
    , 1000 / @fps

  process: ->
    console.log "processing" 

  draw: ->
    @canvas.clearRect 0, 0, @width, @height
    @player.draw @canvas







