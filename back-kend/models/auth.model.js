const bcrypt = require('bcryptjs');
const userModel = require('./user.model');

module.exports = {
  login: async entity => {
    // entity = {
    //   user: 'test',
    //   pwd: 'test'
    // }
    console.log(entity)
    const rows = await userModel.singleByUserName(entity.f_Username);
    console.log(rows)
    if (!rows.length)
      return null;

    const hashPwd = rows[0].f_Password;
    if (bcrypt.compareSync(entity.f_Password, hashPwd)) {
      return rows[0];
    }

    return null;
  }
};
