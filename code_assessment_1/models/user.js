let mongoose = require('mongoose');
mongoose.Promise = Promise;
let Schema = mongoose.Schema;
let crypto = require('crypto');

let userSchema = new Schema({
    username: {
        type: String,
        required: true
    },
    hash: {
        type: String
    },
    salt: {
        type: String
    },

}, {
    collection: "user",
    strict: 'false'
});

userSchema.methods.validPassword = function(password) {
    let hash = crypto.pbkdf2Sync(password, this.salt, 1000, 64, 'sha512').toString('hex');

    return this.hash === hash;
};
userSchema.methods.createPassword = function(pass,salt) {
    let hash = crypto.pbkdf2Sync(pass, salt, 1000, 64, 'sha512').toString('hex');

    return hash;
};
userSchema.methods.setPassword = function(password) {
    this.salt = crypto.randomBytes(16).toString('hex');

    this.hash = crypto.pbkdf2Sync(password, this.salt, 1000, 64, 'sha512').toString('hex');
};



module.exports = mongoose.model('user', userSchema);
