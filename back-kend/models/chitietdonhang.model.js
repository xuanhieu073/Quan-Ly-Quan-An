const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from chitietdonhang';
    return db.load(sql);
  },
  loadAllWithDetails: () => {
    const sql = `
		select c.CatID, c.CatName, count(p.ProID) as num_of_products
		from chitietdonhang c left join products p on c.CatID = p.CatID
		group by c.CatID, c.CatName`;
    return db.load(sql);
  },
  loadById: id => {
    const sql = `select * from chitietdonhang where CatID = ${id}`;
    return db.load(sql);
  },
  loadByDonHangId: id =>{
    return db.load(`select * from chitietdonhang where donhangid = ${id}`)
  },

  add: entity => db.add(entity, 'chitietdonhang'),

  del: id => db.del({ id: id }, 'chitietdonhang'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { CatID: id }, 'chitietdonhang')
  },
};
