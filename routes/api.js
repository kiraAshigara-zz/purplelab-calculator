var express = require('express');
var router = express.Router();
var mysql = require('../utilities/db_connection');
var Query = require('../utilities/query');
var Response = require('../utilities/response');

router.get('/dasdasd', function (req, res, next) {
    mysql.query(Query.asdasd.getAll()).then(function (rows) {
        Response._200(res, rows);
    }).catch(function (error) {
        Response._500(res, error);
    });
});

module.exports = router;
