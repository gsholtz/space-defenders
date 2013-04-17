class Player
  constructor: ->
    @x = 0
    @y = 0
    @sprite =
      normal: [
        Sprite("spaceship", 42, 43, 39, 43),
        Sprite("spaceship", 42, 89, 39, 43)
      ]
      left: [
        "a",
        "b"
      ]
      right: [
        "a",
        "b"
      ]

  draw: (canvas) ->
    @sprite.normal[1].draw(canvas, @x, @y)
