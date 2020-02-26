const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from tinhthanh';
    return db.load(sql);
  },
  loadById: id => {
    const sql = `select * from tinhthanh where Id = ${id}`;
    return db.load(sql);
  },

  add: entity => db.add(entity, 'tinhthanh'),

  del: id => db.del({ id: id }, 'tinhthanh'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { Id: id }, 'tinhthanh')
  },
};
