$(document).ready ->
  game = new Game()
  game.buildCanvas "div#main", 500, 700
  game.start() 