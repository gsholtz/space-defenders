class Game
  constructor: ->
    #Game properties
    @fps = 30
    @canvasElement = $("<canvas>")
    @canvas = undefined
    @width = 0
    @height = 0

    #FPS counter, resets at 6000
    @fpsC = 0

    #Game elements    
    @background = undefined
    @player = undefined
    @playerBullets = []

    window.game = @

  buildCanvas: (elementAppendSel, width, height) ->
    @width = width
    @height = height

    @canvasElement.attr "width", width
    @canvasElement.attr "height", height
    @canvas = @canvasElement.get(0).getContext("2d")
    @canvasElement.appendTo(elementAppendSel)

  start: ->
    @loadSprites()

    @backgrounds = [new Background(), new Background()]
    @backgrounds[0].y = 0 - @backgrounds[0].height

    @player = new Player()

    setInterval =>
      @process()
      @draw()
    , 1000 / @fps

  process: ->
    @fpsC++

    @backgrounds.forEach (background) ->
      background.scroll()
    
    @processKey()

    if @playerBullets
      @playerBullets.forEach (bullet) ->
        bullet.move()

    @playerBullets = $.grep @playerBullets, (bullet) -> bullet.active
    #console.log @playerBullets.length

    if @fpsC > 6000
      @fpsC = 0 

  draw: ->
    @canvas.clearRect 0, 0, @width, @height

    @backgrounds.forEach (background) ->
      background.draw()

    @player.draw()

    if @playerBullets
      $(@playerBullets).each (i, bullet) ->
        bullet.draw()

  processKey: ->
    @player.setDefault()

    if keydown.left && !keydown.right
      @player.moveLeft()

    if keydown.right && !keydown.left
      @player.moveRight()

    if keydown.space
      @player.shoot(@playerBullets)

  loadSprites: ->
    sprites =
      background: 
        normal: Sprite("starscape")
      bullet:
        normal: Sprite("spaceship", 7, 134, 3, 9)

    
    window.sprites = sprites
  