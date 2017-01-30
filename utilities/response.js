var Response = {
    _500: function (res, trace) {
        var json = {
            message: 'Internal server error',
            trace: trace
        };

        if (trace.errno === 1062) {
            json.message = 'Item already exist';
        }

        return res.status(500).json(json);
    },
    _404: function (res, trace) {
        var json = {
            message: 'Item not found',
            trace: trace
        };

        return res.status(404).json(json);
    },
    _201: function (res, item) {
        return res.status(201).json(item);
    },
    _200: function (res, item) {
        return res.json(item);
    }
};

module.exports = Response;