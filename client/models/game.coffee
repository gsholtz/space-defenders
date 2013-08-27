class Game
  constructor: ->
    #Game properties
    @fps = 30
    @canvasElement = $("<canvas>")
    @canvas = undefined
    @width = 0
    @height = 0

    #FPS counter, resets at 6000
    @fpsC = 0

    #Game elements
    @level = 0
    @background = undefined
    @player = undefined
    @enemies = []
    @explosions = []
    @enemyBullets = []

    window.game = @

  buildCanvas: (elementAppendSel, width, height) ->
    @width = width
    @height = height

    @canvasElement.attr "width", width
    @canvasElement.attr "height", height
    @canvas = @canvasElement.get(0).getContext("2d")
    @canvasElement.appendTo(elementAppendSel)

  start: ->
    @loadSprites()

    @backgrounds = [new Background(), new Background()]
    @backgrounds[0].y = 0 - @backgrounds[0].height

    @player = new Player()

    setInterval =>
      @process()
      @draw()
    , 1000 / @fps

  process: ->
    @fpsC++

    @backgrounds.forEach (background) ->
      background.scroll()

    @processKey()

    #Bullets
    if @player.bullets
      @player.bullets.forEach (bullet) =>
        bullet.move()
        if @enemies
          @enemies.forEach (enemy) =>
            if Util.collides bullet, enemy
              @explosions.push enemy.explode()
              bullet.active = false
              @player.points++

    @player.bullets = @player.bullets.filter (bullet) -> bullet.active

    if @enemyBullets
        @enemyBullets.forEach (bullet) =>
          bullet.move()
          if Util.collides bullet, @player
            @explosions.push @player.explode()
            bullet.active = false

    @enemyBullets = @enemyBullets.filter (bullet) -> bullet.active

    #Enemies
    @enemies.forEach (enemy) =>
      enemy.move()
      enemy.shoot(@enemyBullets)
      if Util.collides enemy, @player
        @explosions.push @player.explode()
        @explosions.push enemy.explode()

    @enemies = @enemies.filter (enemy) -> enemy.active

    @spawnEnemies()

    #Player


    #Explosions
    @explosions.forEach (explosion) ->
      explosion.draw()
    @explosions = @explosions.filter (explosion) -> explosion.active

    #Difficulty
    if @fpsC % 300 == 0
      @level++


    if @fpsC > 6000
      @fpsC = 0

  draw: ->
    @canvas.clearRect 0, 0, @width, @height

    @backgrounds.forEach (background) ->
      background.draw()

    if @player.active
      @player.draw()

    if @player.bullets
      $(@player.bullets).each (i, bullet) ->
        bullet.draw()

    @enemies.forEach (enemy) ->
      enemy.draw()

    if @enemyBullets
      @enemyBullets.forEach (bullet) ->
        bullet.draw()

    @explosions.forEach (explosion) ->
      explosion.draw()

    @drawUI()

  processKey: ->
    if @player.active
      @player.setDefault()

      if keydown.left && !keydown.right
        @player.moveLeft()

      if keydown.right && !keydown.left
        @player.moveRight()

      if keydown.space
        @player.shoot()

  spawnEnemies: ->
    spawnRate = if @level < 90 then 120 - @level else 30
    if @fpsC % spawnRate == 0
      enemy = new Enemy()
      enemy.x = Math.floor(Math.random() * (@width - enemy.width))
      @enemies.push enemy

  drawUI: ->
    @canvas.fillStyle = "yellow"
    @canvas.font = "bold 9px 'Press Start 2P' cursive"
    @canvas.fillText("Score  #{@player.points}", @width - 100, 30)

  loadSprites: ->
    sprites =
      background:
        normal: Sprite("starscape")
      bullet:
        normal: Sprite("spaceship", 7, 134, 3, 9)
        enemy:  Sprite("enemies", 121, 134, 3, 10)
      enemy:
        normal: Sprite("enemies", 142, 190, 27, 31)
      explosion:
        enemy: [
          Sprite("enemies", 229, 335, 22, 25),
          Sprite("enemies", 245, 335, 22, 25),
          Sprite("enemies", 269, 335, 25, 25),
          Sprite("enemies", 297, 335, 25, 25),
          Sprite("enemies", 321, 335, 25, 25),
          Sprite("enemies", 344, 335, 22, 25),
          Sprite("enemies", 363, 335, 20, 25),
          Sprite("enemies", 379, 335, 18, 25),
          Sprite("enemies", 394, 335, 15, 25),
          Sprite("enemies", 406, 335, 15, 25)
        ]


    window.sprites = sprites

