const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from chinhanh';
    return db.load(sql);
  },
  loadCondition: filter => {
    const sql = `select * from chinhanh where IdTinhThanh = ${filter.idtt != 'undefined' ? filter.Idtt: 'IdTinhThanh'} `
    console.log(sql)
    db.load(sql);
  },
  loadById: id => {
    const sql = `select * from chinhanh where CatID = ${id}`;
    return db.load(sql);
  },

  add: entity => db.add(entity, 'chinhanh'),

  del: id => db.del({ id: id }, 'chinhanh'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { id: id }, 'chinhanh')
  },
};
