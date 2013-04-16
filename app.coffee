#Libs
express = require "express"
app = module.exports = express()

#Configuration
app.set "views", __dirname
app.set "view engine", "jade"
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.static "#{__dirname}/client"
app.use app.router

app.listen 1337

#Build Commands
if app.settings.env == "development" 
  exec = require("child_process").exec
  exec "coffee -c -j client/application.js client/models/", (err, stdout, stderr) ->
    if err is not null
      console.log err
    if stderr
      console.log stderr
      console.log "Error on coffee compilation, client-side scripts"

#Server
app.get "/", (req, res) ->
  res.render "index"

console.log "Server running..."