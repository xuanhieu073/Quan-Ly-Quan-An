var db = require('../fn/mysql-db');

exports.loadAll = function () {
	var sql = 'select * from categories';
	return db.load(sql);
}

exports.loadAllWithDetails = function () {
	var sql = `
		select c.CatID, c.CatName, count(p.ProID) as num_of_products
		from categories c left join products p on c.CatID = p.CatID
		group by c.CatID, c.CatName`;
	return db.load(sql);
}

exports.load = function (id) {
	var sql = `select * from categories where CatID = ${id}`;
	return db.load(sql);
}

exports.add = entity => db.add(entity,'categories');
all: () => {
    const sql = 'select * from categories';
    return db.load(sql);
};
exports.loadById = id => {
	const sql = `select * from categories where id = ${id}`;
	return db.load(sql);
};
exports.add = entity => db.add(entity, 'categories');
exports.del = id => db.del({ id: id }, 'categories');
exports.patch = (id, entity) => {
	delete entity.id;
	return db.patch(entity, { CatID: id }, 'categories')
};

// exports.add = function (poco) {
// 	// poco = {
// 	// 	CatID: 1,
// 	// 	CatName: 'new name'
// 	// }

// 	var sql = `insert into categories(CatName) values('${poco.CatName}')`;
// 	return db.insert(sql);
// }

exports.delete = function (id) {
	var sql = `delete from categories where CatID = ${id}`;
	return db.delete(sql);
}