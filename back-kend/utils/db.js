const mysql = require('mysql');
const { promisify } = require('util');

// const createConnection = () => mysql.createConnection({
//   host: 'localhost',
//   port: '8889',
//   user: 'root',
//   password: 'root',
//   database: 'qlbh'
// });

const pool = mysql.createPool({
  connectionLimit: 100,
  host: 'localhost',
  port: '3306',
  user: 'root',
  password: '123456',
  database: 'qlbh'
});

const pool_query = promisify(pool.query).bind(pool);

module.exports = {
  load: sql => pool_query(sql),
  add: (entity, tableName) => pool_query(`insert into ${tableName} set ?`, entity),
  del: (condition, tableName) => pool_query(`delete from ${tableName} where ?`, condition),
  del2Condi: (condition1, condition2, tableName) => pool_query(`delete from ${tableName} where ? and ?`, [condition1, condition2]),
  patch: (entity, condition, tableName) => pool_query(`update ${tableName} set ? where ?`, [entity, condition]),
};
