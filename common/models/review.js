'use strict';

const DataSource = require('loopback-datasource-juggler').DataSource;
const MySQL = require('loopback-connector-mysql'); 

// 建立連線-MySQL
let dataSource = new DataSource({
  connector: MySQL,
  host: 'localhost',
  port: 3308,
  database: 'shop',
  user: 'root',
  password: 'root'
});

module.exports = function(Review) {
  // SQL 語法
  let sql = `SELECT coffeeshop.id As coffeeshopId, coffeeshop.name AS shop,
                    reviewer.id AS reviewerId, reviewer.email, review.id AS id, 
                    review.rate, review.content, review.timestamp
             FROM coffeeshop
             INNER JOIN review
             ON coffeeshop.id=review.coffeeshopId
             INNER JOIN reviewer
             ON reviewer.id=review.reviewerId;`;

  /**
   * @function list 自訂RESTful API
   * @param {function} callback 回乎函數
   */
  Review.list = function(callback) {
    let response;
    
    /**
     * @function dataSource.connector.execute 執行SQL語法
     * @param string   sql語法
     * @param array    sql的參數
     * @param function 回乎函數
     */
    dataSource.connector.execute(sql, null, (error, result) => {
      response = result;
      callback(null, response);
    });
  };

  Review.remoteMethod('list', {
    http: { path: '/list', verb: 'get' }, // 設定API路徑與方法
    returns: { arg: 'list' } // 回傳的參數設定
  });
};
