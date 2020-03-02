const express = require('express');
const chinhanhModel = require('../models/chinhanh.model');

const router = express.Router();

router.get('/', async (req, res, next) => {
  console.log(req.query)
  const rows = await chinhanhModel.loadCondition(req.query);
  res.json(rows);
})

router.get('/:id', async (req, res) => {

  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const id = req.params.id || -1;
  try {
    const rows = await chinhanhModel.loadById(id);
    if (rows.length === 0) {
      res.status(204).end();
    } else {
      res.json(rows[0]);
    }
  } catch (err) {
    console.log(err);
    res.status(500);
    res.end('View error log on console.');
  }
})

router.post('/', async (req, res) => {
  try {
    const results = await chinhanhModel.add(req.body);
    const ret = {
      CatID: results.insertId,
      ...req.body
    }
    res.status(201).json(ret);
  } catch (err) {
    throw new Error(err);
  }
})

router.delete('/', (req, res) => {
  res.json({
    msg: 'del'
  });
})

router.patch('/:id', async (req, res) => {
  const id = req.params.id;
  if(isNaN(id)){
    res.status(400).json('ivalid id');
  }
  try{
    const results = await chinhanhModel.patch(id, req.body)
    res.json({
      msg: 'patched'
    });
  }
  catch{err=>{
    throw new Error(err);
  }}
})

module.exports = router;