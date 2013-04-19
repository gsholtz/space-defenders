class Background
  constructor: ->
    @x = 0
    @y = 0
    @width = 900
    @height = 640

    @type = "normal"

    @sprite = window.sprites.background

  draw: ->
    canvas = window.game.canvas
    @sprite[@type].draw canvas, @x, @y

  scroll: ->
    canvas = window.game.canvas
    @y += 3

    if @y > window.game.height + 10
      @y = 0 - @height