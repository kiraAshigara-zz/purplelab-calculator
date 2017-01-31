var mysql = require('promise-mysql');
var DB_CONNECTION = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'andres89',
    database: 'calculatorDB'
});

module.exports = DB_CONNECTION;
