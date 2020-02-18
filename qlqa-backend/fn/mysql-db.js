const mysql = require('mysql');
const opts = require('../fn/opts');
const { promisify } = require('util');

// var createConnection = () => {
//     return mysql.createConnection({
//         host: opts.DB.HOST,
//         port: opts.DB.PORT,
//         user: opts.DB.USER,
//         password: opts.DB.PWD,
//         database: opts.DB.DB_NAME
//     });
// }

const pool = mysql.createPool({
    connectionLimit: 100,
    host: opts.DB.HOST,
    port: opts.DB.PORT,
    user: opts.DB.USER,
    password: opts.DB.PWD,
    database: opts.DB.DB_NAME
});

const pool_query = promisify(pool.query).bind(pool);

exports.load = sql => pool_query(sql);
exports.add = (entity, tableName) => pool_query(`insert into ${tableName} set ?`, entity);
exports.del = (condition, tableName) => pool_query(`delete from ${tableName} where ?`, condition),
exports.patch = (entity, condition, tableName) => pool_query(`update ${tableName} set ? where ?`, [entity, condition]),

exports.insert = function(sql) {
    return new Promise((resolve, reject) => {
        var cn = createConnection();
        cn.connect();
        cn.query(sql, function(error, value) {
            if (error) {
                reject(error);
            } else {
                resolve(value.insertId);
            }

            cn.end();
        });
    });
}

exports.delete = function(sql) {
    return new Promise((resolve, reject) => {
        var cn = createConnection();
        cn.connect();
        cn.query(sql, function(error, value) {
            if (error) {
                reject(error);
            } else {
                resolve(value.affectedRows);
            }

            cn.end();
        });
    });
}