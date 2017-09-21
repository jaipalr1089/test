const express = require('express')
const router = express.Router()
const auth = require('../controllers/auth')

//authentication routes
router.post('/signup', auth.signup)
router.post('/login', auth.signin)
// router.get('/', function(req, res) {
//     res.render('index', { title: 'Express' });
// });

module.exports = router
