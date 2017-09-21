passport = require('passport')
LocalStrategy = require('passport-local').Strategy
mongoose = require('mongoose')
user = require('../models/user')
passport.use new LocalStrategy((username, password, done) ->
  user.findOne { username: username }, (err, user) ->
    if err
      return done(err)
    if !user
      return done(null, false, message: 'Incorrect username.')
    if !user.validPassword(password)
      return done(null, false, message: 'Incorrect password.')
    done null, user
  return
)
