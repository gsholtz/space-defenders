class Player
  constructor: ->
    @x = (window.game.width / 2) - (39 / 2)
    @y = window.game.height - 55
    @width = 39
    @height = 43
    @movementState = "normal"
    @sprite =
      normal: [
        Sprite("spaceship", 42, 43, 39, 43),
        Sprite("spaceship", 42, 89, 39, 43)
      ]
      left: [
        Sprite("spaceship", 2, 43, 39, 43),
        Sprite("spaceship", 2, 89, 39, 43)
      ]
      right: [
        Sprite("spaceship", 83, 43, 39, 43),
        Sprite("spaceship", 83, 89, 39, 43)
      ]

  draw: ->
    canvas = window.game.canvas
    fpsC = window.game.fpsC

    @x = @x.clamp(0, window.game.width - @width);

    animState = 0
    if fpsC % 6 > 2 #every tenth of second, changes the animation state
      animState = 1

    @sprite[@movementState][animState].draw(canvas, @x, @y)

  setDefault: ->
    @movementState = "normal"

  moveLeft: ->
    @x -= 6
    @movementState = "left"

  moveRight: ->
    @x += 6
    @movementState = "right"
