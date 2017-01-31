var express = require('express');
var router = express.Router();
var mysql = require('../utilities/db_connection');
var Query = require('../utilities/query');
var Response = require('../utilities/response');

router.get('/purplelab/info', function (req, res, next) {
    var info = {
        business: {}
    };

    mysql.query(Query.business_type()).then(function (rows) {

        for (var i = 0, size = rows.length; i < size; i++) {
            if (!info.business[rows[i].biz_type_fk]) {
                info.business[rows[i].biz_type_fk] = {
                    type: rows[i].biz_type,
                    size: []
                };
            }

            info.business[rows[i].biz_type_fk].size.push({
                id: rows[i].biz_size_fk,
                name: rows[i].biz_size
            });
        }

        var tempList = [];

        for (var key in info.business) {
            info.business[key].id = key;
            tempList.push(info.business[key])
        }

        info.business = tempList;

        return mysql.query(Query.geo());
    }).then(function (rows) {
        info.geo = rows;
        return mysql.query(Query.therapeutic_area());
    }).then(function (rows) {
        info.therapeutic_area = rows;
        return mysql.query(Query.reports());
    }).then(function (rows) {
        info.reports = rows;
        return mysql.query(Query.reports_retrievers());
    }).then(function (rows) {
        info.reports_retrievers = rows;
        return mysql.query(Query.term());
    }).then(function (rows) {
        info.term = rows;
        return mysql.query(Query.num_of_users());
    }).then(function (rows) {
        info.num_of_users = rows;
        Response._200(res, info);
    }).catch(function (error) {
        Response._500(res, error);
    });
});

router.get('/purplelab/calculate', function (req, res, next) {
    var business_type = req.params.business_type;
    var business_size = req.params.business_size;
    var geo_discount = req.params.geo_discount;
    var therapeutic_area = req.params.therapeutic_area;
    var reports = req.params.reports;
    var reports_retrievers = req.params.reports_retrievers;
    var term = req.params.term;
    var term_discount = req.params.term_discount;
    var num_of_users = req.params.num_of_users;
});

module.exports = router;
