class Bullet
  constructor: (type) ->
    @x = 0
    @y = 0
    @width = 3
    @height = 9
    @speed = 10
    @type = if type then type else "normal"
    @active = true
    @sprite = window.sprites.bullet[@type]

  draw: ->
    canvas = window.game.canvas
    @sprite.draw canvas, @x, @y

  move: (speed) ->
    @speed = speed if speed

    if @type is "normal"
      @y -= @speed
    else
      @y += @speed

    if @y + @height < 0 or @y > window.game.height #out of bounds
      @active = false




