const express = require('express')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const path = require('path');
const app = express()

const PORT = process.env.PORT || 8000

mongoose.connect('localhost:27017/dev', (err, db) => {
    if (err)
        console.log(err)
    else
        console.log("successfully connected to mongo db");
});

require('./utils/passport');
app.use(express.static(__dirname +'/public')); 
app.set('views', __dirname+ '/public/views');
app.set('view engine', 'jade');


app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true
}))
  app.get('/', (req, res, next) => {
    res.render('index.jade');
 })
  app.get('/auth', (req, res, next) => {
    console.log("In partials")
    res.render('auth.jade');
 })
   app.get('/signin', (req, res, next) => {
    console.log("In partials")
    res.render('signin.jade');
 })
    app.get('/home', (req, res, next) => {
    res.render('home.jade');
 })
  
app.use('/api', require('./routes/routes'))
const server = app.listen(PORT, (request, response) => {
    const host = server.address().host;
    const port = server.address().port
    console.log(`app is listening at ${port}`)
})

module.exports = app
