$(document).ready ->
  game = new Game()
  game.buildCanvas "div#main", 400, 300
  game.start()
