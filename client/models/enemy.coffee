class Enemy
  constructor: ->
    @x = 0
    @y = -31 
    @width = 27
    @height = 31
    @type = "normal"
    @active = true
    @sprite = window.sprites.enemy[@type]

    @xSpeed = 0

  draw: ->
    canvas = window.game.canvas

    @x = @x.clamp(0, window.game.width - @width);
    @sprite.draw canvas, @x, @y

  move: ->
    chance = Math.floor(Math.random() * 100)

    if chance > 90
      if chance > 96
        @xSpeed = 0
      else if chance > 93
        @xSpeed = 3
      else 
        @xSpeed = -3

    @x += @xSpeed
    @y += 2

    if @y > window.game.height
      @active = false

  explodes: ->
    @active = false
    