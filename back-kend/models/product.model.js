const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from products';
    return db.load(sql);
  },
  loadByCat: (catId) => {
    const sql = `select * from products where CatID = ${catId}`;
    return db.load(sql);
  },

  loadById: id => {
    const sql = `select * from products where ProID = ${id}`;
    return db.load(sql);
  },

  add: entity => db.add(entity, 'products'),

  del: id => db.del({ ProID: id }, 'products'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { ProID: id }, 'products')
  },
};
