express = require 'express'
bodyParser = require 'body-parser'
mongoose = require 'mongoose'
path = require 'path'
passport = require 'passport'
app = express()

PORT = process.env.PORT or 8000



mongoose.connect 'localhost:27017/dev', (err, db) ->
  if err
    console.log err
  else
    console.log "successfully connected to mongo db"
app.use passport.initialize()
require('./utils/passport')
app.use express.static(__dirname + '/public')
app.set 'views', __dirname + '/public/views'
app.set 'view engine', 'jade'


app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)


app.get '/', (req, res, next) ->
  res.render 'index.jade'
  return

app.get '/auth', (req, res, next) ->
  console.log "In partials"
  res.render 'auth.jade'
  return


  app.get '/signin', (req, res, next) ->
    console.log "In partials"
    res.render 'signin.jade'
    return

    app.get '/home', (req, res, next) ->
    res.render 'home.jade'
    return

app.use '/api', require('./routes/router')
server = app.listen PORT, (request, response) ->
  host = server.address().host;
  port = server.address().port
  console.log 'app is listening at ${port}'

module.exports = app
