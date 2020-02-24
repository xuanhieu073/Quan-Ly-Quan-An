const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from categories';
    return db.load(sql);
  },
  loadAllWithDetails: () => {
    const sql = `
		select c.CatID, c.CatName, count(p.ProID) as num_of_products
		from categories c left join products p on c.CatID = p.CatID
		group by c.CatID, c.CatName`;
    return db.load(sql);
  },
  loadById: id => {
    const sql = `select * from categories where CatID = ${id}`;
    return db.load(sql);
  },

  add: entity => db.add(entity, 'categories'),

  del: id => db.del({ id: id }, 'categories'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { id: id }, 'categories')
  },
};
