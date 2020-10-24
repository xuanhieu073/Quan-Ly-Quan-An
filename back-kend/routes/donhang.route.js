const express = require('express');
const donhangModel = require('../models/donhang.model')
const chitietdonhangModel = require('../models/chitietdonhang.model')

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await donhangModel.loadAllWithDetails();
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
    const rows = await donhangModel.loadById(id);
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

router.get('/:id/chitiet', async (req, res) => {

  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const id = req.params.id || -1;
  try {
    const rows = await chitietdonhangModel.loadByDonHangId(id)
    if (rows.length === 0) {
      res.status(204).end();
    } else {
      res.json(rows);
    }
  } catch (err) {
    console.log(err);
    res.status(500);
    res.end('View error log on console.');
  }
})

router.get('/user/:id',async (req,res)=>{
  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }
  const id = req.params.id || -1
  try{
    const rows = await donhangModel.loadByUserId(id)
    res.json(rows)
  }
  catch(err){

  }
})

router.get('/chinhanh/:chinhanhid/ban/:id',async (req,res)=>{
  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }
  const id = req.params.id || -1
  const chinhanhid = req.params.chinhanhid || -1
  try{
    const rows = await donhangModel.loadByBanId(chinhanhid,id)
    res.json(rows)
  }
  catch(err){

  }
})

router.post('/', async (req, res) => {
  req.body.createdate = new Date();
  try {
    const results = await donhangModel.add(req.body);
    const ret = {
      CatID: results.insertId,
      ...req.body
    }
    res.status(201).json(ret);
  } catch (err) {
    console.log(err)
    res.status(500).json(err);
  }
})

router.post('/:id', async (req, res) => {
  console.log(req.body)
  try {
    for(i=0;i<req.body.length;i++){
      await chitietdonhangModel.add(req.body[i]);
    }
    res.status(201);
  } catch (err) {
    console.log(err)
    res.status(500).json(err);
  }
})

router.delete('/del', (req, res) => {
  res.json({
    msg: 'del'
  });
})

router.patch('/patch', (req, res) => {
  res.json({
    msg: 'patched'
  });
})

module.exports = router;