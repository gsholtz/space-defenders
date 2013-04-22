class Enemy
  constructor: ->
    @x = 0
    @y = 0 
    @width = 27
    @height = 21
    @type = "normal"
    @active = true
    @sprite = window.sprites.enemy[@type]

  draw: ->
    canvas = window.game.canvas
    @sprite.draw canvas, @x, @y

  move: ->
    console.log "enemy move"


  