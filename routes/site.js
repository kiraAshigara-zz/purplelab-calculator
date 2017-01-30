var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/purplelab-calculator', function(req, res, next) {
  res.render('calculator');
});

module.exports = router;
