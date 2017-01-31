var Query = {
    business_type: function () {
        var query = 'select BASE_PRICING.biz_type_fk, BUSINESS_TYPE_TBL.biz_type, BASE_PRICING.biz_size_fk, BUSINESS_SIZE_TBL.biz_size from BASE_PRICING' +
            ' join BUSINESS_SIZE_TBL on BASE_PRICING.biz_size_fk = BUSINESS_SIZE_TBL.id' +
            ' join BUSINESS_TYPE_TBL on BASE_PRICING.biz_type_fk = BUSINESS_TYPE_TBL.id' +
            ' order by BASE_PRICING.biz_type_fk, BASE_PRICING.biz_size_fk';
        return query;
    },
    geo: function () {
        var query = 'select * from GEOGRAPHIC_BLOCK_TBL;';
        return query;
    },
    therapeutic_area: function () {
        var query = 'select * from THERAPEUTIC_CLASS_TBL;';
        return query;
    },
    reports: function () {
        var query = 'select * from PROVIDER_LEVEL_TBL;';
        return query;
    },
    reports_retrievers: function () {
        var query = 'select * from RETREIVER_REPORT_TBL;';
        return query;
    },
    term: function () {
        var query = 'select * from TERM_TBL;';
        return query;
    },
    num_of_users: function () {
        var query = 'select * from USERS_TBL;';
        return query;
    }
};

module.exports = Query;
