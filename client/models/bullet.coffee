class Bullet
  constructor: ->
    @x = 0
    @y = 0
    @width = 3
    @height = 9
    @type = "normal"
    @active = true
    @sprite = Sprite("spaceship", 7, 134, 3, 9)


  draw: ->
    canvas = window.game.canvas
    @sprite.draw canvas, @x, @y

  move: ->
    @y -= 10
    if @y + @height < 0 #out of bounds 
      @active = false



