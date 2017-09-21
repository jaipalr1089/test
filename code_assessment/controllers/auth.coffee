'use strict';

passport = require 'passport'
mongoose = require 'mongoose'
users = require '../models/user'

signup = (request, response, next) ->

    if !request.body.username or !request.body.password
        return response.status(400).json({ message: 'Please fill out all fields' });


    user = new users();

    user.username = request.body.username;

    user.setPassword(request.body.password);
    user.save (err) ->
        if err
            return next(err);

         response.json message: "Registered successfully"


signin = (request, response, next) ->
    if !request.body.username or !request.body.password
        return response.status(400).json message: 'Please fill out all fields'

    passport.authenticate('local', (err, user, info) ->
        if err
            return next(err);

        if user
            response.json message: "Logged in successfully"
         else
            response.status(401).json info
    ) request, response, next
    return




exports.signup = signup;
exports.signin = signin;