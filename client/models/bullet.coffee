class Bullet
  constructor: (type) ->
    @x = 0
    @y = 0
    @width = 3
    @height = 9
    @type = if type then type else "normal"
    @active = true
    @sprite = window.sprites.bullet[@type]

  draw: ->
    canvas = window.game.canvas
    @sprite.draw canvas, @x, @y

  move: ->
    @y -= 10
    if @y + @height < 0 #out of bounds
      @active = false




