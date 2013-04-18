$(document).ready ->
  game = new Game()
  game.buildCanvas "div#main", 600, 600
  game.start() 