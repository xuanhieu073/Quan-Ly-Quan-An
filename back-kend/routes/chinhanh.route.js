const express = require('express');
const chinhanhModel = require('../models/chinhanh.model');
const menuchinhanhModel = require('../models/menuchinhanh.model')

const router = express.Router();

router.get('/', async (req, res, next) => {
  if(req.query.idtt == 'undefined') req.query.idtt = null
  if(req.query.tenchinhanh == 'undefined') req.query.tenchinhanh = ''
  if(req.query.sdt == 'undefined') req.query.sdt = ''
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

router.get('/:id/cat/:catid/Food', async (req,res)=>{
  const id = req.params.id
  const catid = req.params.catid
  const results = await menuchinhanhModel.loadbyCatId(id,catid);
  res.json(results);
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

router.delete('/:id', async (req, res) => {
  const id = req.params.id
  if(isNaN(id))
    res.status(400).json('ivalid id');
  try{
    const results = await chinhanhModel.del(id);
    res.json(results);
  }
  catch(err){
    throw new Error(err);
  }
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