mongoose = require('mongoose')
mongoose.Promise = Promise
Schema = mongoose.Schema
crypto = require('crypto')
userSchema = new Schema({
  username:
    type: String
    required: true
  hash: type: String
  salt: type: String
},
  collection: 'user'
  strict: 'false')

userSchema.methods.validPassword = (password) ->
  hash = crypto.pbkdf2Sync(password, @salt, 1000, 64, 'sha512').toString('hex')
  console.log hash
  @hash == hash

userSchema.methods.createPassword = (pass, salt) ->
  console.log pass
  console.log salt
  hash = crypto.pbkdf2Sync(pass, salt, 1000, 64, 'sha512').toString('hex')
  return hash

userSchema.methods.setPassword = (password) ->
  console.log password
  @salt = crypto.randomBytes(32).toString('hex')
  @hash = crypto.pbkdf2Sync(password, @salt, 1000, 64, 'sha512').toString('hex')
  return

module.exports = mongoose.model('user', userSchema)
