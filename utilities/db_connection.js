var mysql = require('promise-mysql');
var DB_CONNECTION = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'dev',
    database: 'asdsd'
});

module.exports = DB_CONNECTION;