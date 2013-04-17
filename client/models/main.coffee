$(document).ready ->
  game = new Game()
  game.buildCanvas "div#main", 600, 700
  game.start() 