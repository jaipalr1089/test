express = require('express')
router = express.Router()
auth = require('../controllers/auth')


router.post '/signup', auth.signup
router.post '/login', auth.signin
module.exports = router
