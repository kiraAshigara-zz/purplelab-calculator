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
    var business_type = parseFloat(req.query.business_type);
    var business_size = parseFloat(req.query.business_size);
    var geo_discount = parseFloat(req.query.geo_discount);
    var therapeutic_area = parseFloat(req.query.therapeutic_area);
    var reports = parseFloat(req.query.reports);
    var reports_retrievers = parseFloat(req.query.reports_retrievers);
    var term = parseFloat(req.query.term);
    var term_discount = parseFloat(req.query.term_discount);
    var num_of_users = parseFloat(req.query.num_of_users);

    var result = {};
    var minimun_value;

    mysql.query(Query.base_annual(business_type, business_size)).then(function (rows) {
        result.base_annual_subscription = Math.round(rows[0].base_annual_subscription);
        return mysql.query(Query.minimun_value(business_type));
    }).then(function (rows) {
        minimun_value = rows[0]['MIN(BASE_PRICING.base_annual_subscription)'];

        var base1 =
            result.base_annual_subscription *
            geo_discount *
            therapeutic_area *
            reports *
            reports_retrievers *
            term_discount *
            num_of_users;

        result.discounted_annual_subscription = Math.max(base1, minimun_value);

        result.full_term_pricing = Math.round(result.discounted_annual_subscription * term);
        result.discounted_annual_subscription = Math.round(result.discounted_annual_subscription);

        Response._200(res, result);
    }).catch(function (error) {
        Response._500(res, error);
    });
});

module.exports = router;
