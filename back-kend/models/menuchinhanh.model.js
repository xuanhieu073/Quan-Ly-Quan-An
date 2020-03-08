const db = require('../utils/db');

module.exports = {
  all: () => {
    const sql = 'select * from menuchinhanh';
    return db.load(sql);
  },
  loadById: id => {
    const sql = `select * from menuchinhanh where Id = ${id}`;
    return db.load(sql);
  },
  loadbyCatId: (ChiNhanhId,CatID) =>{
    const sql = `select p.ProID,p.ProName,p.TinyDes,p.Price,p.CatID,case when m.FoodId is null then 0 else 1 end as 'check'
    from products as p
    left join menuchinhanh as m on p.ProID = m.FoodId and m.ChiNhanhId = ${ChiNhanhId}
    where p.CatID = ${CatID}`
    return db.load(sql)
  },

  add: entity => db.add(entity, 'menuchinhanh'),

  del: id => db.del({ id: id }, 'menuchinhanh'),

  patch: (id, entity) => {
    delete entity.id;
    return db.patch(entity, { Id: id }, 'menuchinhanh')
  },
};
