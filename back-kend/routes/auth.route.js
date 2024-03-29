const express = require('express');
const jwt = require('jsonwebtoken');
const rndToken = require('rand-token');
const authModel = require('../models/auth.model');

const router = express.Router();

//
// login

router.post('/', async (req, res) => {
  // req.body = {
  // 	user: 'test',
  // 	pwd: 'test'
  // }

  const ret = await authModel.login(req.body);
  // console.log(ret) 
  if (ret === null) {
    return res.status(400).json({
      authenticated: false
    });
  }

  const payload = {
    userId: ret.f_ID,
    permission: ret.f_Permission,
    ...ret
  }
  const token = jwt.sign(payload, 'shhhhh', {
    expiresIn: 10 * 60 * 1000 // 10 mins
  });
  const rfToken = rndToken.generate(80);
  res.json({
    // authenticated: true,
    accessToken: token,
    refreshToken: rfToken,
    payload: payload
  })
})

module.exports = router;