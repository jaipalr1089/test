'use strict';

const passport = require('passport');
const mongoose = require('mongoose');
const users = require('../models/user');

let signup = (request, response, next) => {

    if (!request.body.username || !request.body.password) {
        return response.status(400).json({ message: 'Please fill out all fields' });
    }

    const user = new users();

    user.username = request.body.username;

    user.setPassword(request.body.password)

    user.save(function(err) {
        if (err) {
            return next(err);
        }

        return response.json({ message: "Registered successfully" })
    });
}

let signin = (request, response, next) => {
    if (!request.body.username || !request.body.password) {
        return response.status(400).json({ message: 'Please fill out all fields' });
    }

    passport.authenticate('local', (err, user, info) => {
        if (err) {
            return next(err);
        }

        if (user) {
            return response.json({ message: "Logged in successfully"
        });
        } else {
            return response.status(401).json(info);
        }
    })(request, response, next);
}


exports.signup = signup;
exports.signin = signin;
