class Util
  @collides: (a, b) ->
    a.x < b.x + b.width and
    a.x + a.width > b.x and
    a.y < b.y + b.height and
    a.y + a.height > b.y