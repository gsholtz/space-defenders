class Explosion
  constructor: (x, y) ->
    @x = x
    @y = y
    @width = 25
    @height = 25
    @type = "enemy"
    @active = true
    @sprite = window.sprites.explosion[@type]
    @state = 0

  draw: ->
    canvas = window.game.canvas

    if @state > 4
      @x += 0.5

    if @state < 10
      @sprite[@state].draw canvas, @x, @y
    else
      @active = false

    if window.game.fpsC % 2 == 0
      @state++