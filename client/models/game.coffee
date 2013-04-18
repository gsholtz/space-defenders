class Game
  constructor: ->
    @fps = 30
    @canvasElement = $("<canvas>")
    @canvas = undefined
    @width = 0
    @height = 0
    @fpsC = 0 
    @bgSprite = Sprite("starscape")
    window.game = @

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
    @fpsC++
    
    @processKey()

    if @fpsC > 6000
      @fpsC = 0 

  draw: ->
    @canvas.clearRect 0, 0, @width, @height
    @drawBackGroud()
    @player.draw()

  processKey: ->
    @player.setDefault()

    if keydown.left && !keydown.right
      @player.moveLeft()

    if keydown.right && !keydown.left
      @player.moveRight()

    if keydown.space
      @player.shoot()

  drawBackGroud: ->
    @bgSprite.draw @canvas, 0, 0