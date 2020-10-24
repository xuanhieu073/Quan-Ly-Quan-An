const express = require('express');
const userModel = require('../models/user.model');

const router = express.Router();

router.get('/user', async (req,res)=>{
  if(req.query.username == '') 
    res.status(400).json('ivalid username')

  const username = req.query.username
  const rows = await userModel.singleByUserName(req.query.username)
  if(rows.length == 0)
    res.status(204);
  else
    res.json(rows[0])
})

router.post('/', async (req, res) => {
  const results = await userModel.add(req.body);
  const ret = {
    f_ID: results.insertId,
    ...req.body
  }
  delete ret.f_Password;
  res.status(201).json(ret);
})


module.exports = router;