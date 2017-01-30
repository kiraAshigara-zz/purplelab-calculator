var express = require('express');
var router = express.Router();

router.get('/apisito', function (req, res, next) {
    res.json({"oe": "que?"});
});

module.exports = router;
