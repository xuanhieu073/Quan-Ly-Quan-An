const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from donhang';
    return db.load(sql);
  },
  loadByUserId: userId =>{
    return db.load(`select * from donhang where userid = ${userId}`)
  },
  loadByBanId: (chinhanhId, bananId) =>{
    return db.load(`select * from donhang where bananid = ${bananId} and chinhanhid = ${chinhanhId}`)
  },
  loadAllWithDetails: () => {
    const sql = `
		select c.CatID, c.CatName, count(p.ProID) as num_of_products
		from donhang c left join products p on c.CatID = p.CatID
		group by c.CatID, c.CatName`;
    return db.load(sql);
  },
  loadById: id => {
    const sql = `select * from donhang where CatID = ${id}`;
    return db.load(sql);
  },

  add: entity => db.add(entity, 'donhang'),

  del: id => db.del({ id: id }, 'donhang'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { CatID: id }, 'donhang')
  },
};
